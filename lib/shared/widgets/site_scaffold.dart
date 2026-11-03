import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/links.dart';
import '../../core/responsive.dart';
import '../../data/profile.dart';
import 'content_width.dart';
import 'hover_builder.dart';

class _NavItem {
  const _NavItem(this.label, this.route);
  final String label;
  final String route;
}

const _navItems = [
  _NavItem('Home', Routes.home),
  _NavItem('About', Routes.about),
  _NavItem('Projects', Routes.projects),
  _NavItem('Contact', Routes.contact),
];

/// Shared page shell: sticky header with navigation, scrollable body and footer.
class SiteScaffold extends StatelessWidget {
  const SiteScaffold({super.key, required this.currentRoute, required this.children});

  /// Route of the nav item to highlight.
  final String currentRoute;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final compactNav = context.isMobile;

    return Scaffold(
      appBar: _Header(currentRoute: currentRoute, compact: compactNav),
      endDrawer: compactNav ? _NavDrawer(currentRoute: currentRoute) : null,
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            SliverList.list(children: children),
            const SliverFillRemaining(hasScrollBody: false, child: _Footer()),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget implements PreferredSizeWidget {
  const _Header({required this.currentRoute, required this.compact});

  final String currentRoute;
  final bool compact;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background.withValues(alpha: 0.92),
      child: Container(
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
        child: SafeArea(
          bottom: false,
          child: ContentWidth(
            child: SizedBox(
              height: 72,
              child: Row(
                children: [
                  const _Logo(),
                  const Spacer(),
                  if (compact)
                    Builder(
                      builder: (context) => IconButton(
                        tooltip: 'Menu',
                        icon: const Icon(Icons.menu_rounded),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                      ),
                    )
                  else
                    for (final item in _navItems) _NavLink(item: item, selected: item.route == currentRoute),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge;
    return HoverBuilder(
      onTap: () => context.go(Routes.home),
      builder: (context, _) => Text.rich(
        const TextSpan(
          text: '${Profile.firstName} ',
          children: [TextSpan(text: Profile.lastName, style: TextStyle(color: AppColors.accent))],
        ),
        style: style,
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.item, required this.selected});

  final _NavItem item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: HoverBuilder(
        onTap: () => context.go(item.route),
        builder: (context, hovered) {
          final active = selected || hovered;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 150),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: active ? AppColors.textPrimary : AppColors.textMuted,
                      ),
                  child: Text(item.label),
                ),
                const SizedBox(height: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: 2,
                  width: selected ? 20 : 0,
                  color: AppColors.accent,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NavDrawer extends StatelessWidget {
  const _NavDrawer({required this.currentRoute});

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(radius: 24, backgroundImage: AssetImage(Profile.photo)),
                  const Spacer(),
                  IconButton(icon: const Icon(Icons.close_rounded), onPressed: () => Navigator.of(context).pop()),
                ],
              ),
              const SizedBox(height: 32),
              for (final item in _navItems)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    item.label,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: item.route == currentRoute ? AppColors.accent : AppColors.textPrimary,
                        ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    context.go(item.route);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted);
    final copyright = Text('© ${DateTime.now().year} ${Profile.fullName}', style: muted);
    const socials = SocialLinks(size: 22);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 80),
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppColors.border))),
        child: ContentWidth(
          vertical: 28,
          child: context.isMobile
              ? Column(children: [socials, const SizedBox(height: 16), copyright])
              : Row(children: [copyright, const Spacer(), socials]),
        ),
      ),
    );
  }
}

/// Row of social icons (LinkedIn, GitHub).
class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key, this.size = 28});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final social in Profile.socials)
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Tooltip(
              message: social.label,
              child: HoverLift(
                onTap: () => openLink(context, social.url),
                child: Image.asset(social.asset, width: size, height: size),
              ),
            ),
          ),
      ],
    );
  }
}
