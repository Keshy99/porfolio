import 'package:flutter/material.dart';

/// A custom elevated button that can also show a loading indicator where necessary
class CustomButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double? width;

  const CustomButton(
      {Key? key,
      this.icon,
      required this.text,
      required this.onPressed,
      this.backgroundColor,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          fixedSize: Size(width!, 50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
          if (icon != null) const SizedBox(width: 15),
          Text(text,
              style:
                  Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary))
        ],
      ),
    );
  }
}
