import 'package:flutter/material.dart';

/// Rebuilds with the current hover state and shows a pointer cursor when [onTap] is set.
class HoverBuilder extends StatefulWidget {
  const HoverBuilder({super.key, required this.builder, this.onTap});

  final Widget Function(BuildContext context, bool hovered) builder;
  final VoidCallback? onTap;

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: widget.builder(context, _hovered),
      ),
    );
  }
}

/// Lifts [child] a few pixels while hovered.
class HoverLift extends StatelessWidget {
  const HoverLift({super.key, required this.child, this.onTap, this.offset = 4});

  final Widget child;
  final VoidCallback? onTap;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, hovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, hovered ? -offset : 0, 0),
        child: child,
      ),
    );
  }
}
