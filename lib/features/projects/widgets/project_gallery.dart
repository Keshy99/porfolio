import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import '../../../core/responsive.dart';
import '../../../shared/widgets/hover_builder.dart';

/// Screenshot carousel with arrows and a thumbnail strip. Tapping the image opens a fullscreen viewer.
class ProjectGallery extends StatefulWidget {
  const ProjectGallery({super.key, required this.images});

  final List<String> images;

  @override
  State<ProjectGallery> createState() => _ProjectGalleryState();
}

class _ProjectGalleryState extends State<ProjectGallery> {
  final _pageController = PageController();
  final _thumbController = ScrollController();
  int _index = 0;

  bool get _hasMany => widget.images.length > 1;

  @override
  void dispose() {
    _pageController.dispose();
    _thumbController.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    if (index < 0 || index >= widget.images.length) return;
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 350), curve: Curves.easeOutCubic);
  }

  void _openViewer() {
    showImageViewerPager(
      context,
      MultiImageProvider([for (final image in widget.images) AssetImage(image)], initialIndex: _index),
      swipeDismissible: true,
      doubleTapZoomable: true,
      onPageChanged: _goTo,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = context.isMobile ? 440.0 : 560.0;

    return Column(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              ScrollConfiguration(
                // Allow mouse-drag swiping on web.
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.trackpad},
                ),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.images.length,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemBuilder: (context, i) => HoverBuilder(
                    onTap: _openViewer,
                    builder: (context, _) => Padding(
                      padding: const EdgeInsets.all(24),
                      child: Image.asset(widget.images[i], fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
              if (_hasMany) ...[
                Positioned(
                  left: 12,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: _ArrowButton(
                      icon: Icons.chevron_left_rounded,
                      onPressed: _index > 0 ? () => _goTo(_index - 1) : null,
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: _ArrowButton(
                      icon: Icons.chevron_right_rounded,
                      onPressed: _index < widget.images.length - 1 ? () => _goTo(_index + 1) : null,
                    ),
                  ),
                ),
              ],
              Positioned(
                right: 16,
                bottom: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.zoom_out_map_rounded, size: 14, color: AppColors.textMuted),
                      const SizedBox(width: 6),
                      Text(
                        '${_index + 1} / ${widget.images.length}',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_hasMany) ...[
          const SizedBox(height: 16),
          SizedBox(
            height: 76,
            child: ListView.separated(
              controller: _thumbController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, i) => HoverBuilder(
                onTap: () => _goTo(i),
                builder: (context, hovered) => AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 64,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: i == _index
                          ? AppColors.accent
                          : hovered
                              ? AppColors.textMuted
                              : AppColors.border,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(widget.images[i], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 150),
      opacity: onPressed == null ? 0.3 : 1,
      child: IconButton.filled(
        onPressed: onPressed,
        icon: Icon(icon),
        style: IconButton.styleFrom(
          backgroundColor: Colors.black.withValues(alpha: 0.6),
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.black.withValues(alpha: 0.6),
          disabledForegroundColor: Colors.white,
        ),
      ),
    );
  }
}
