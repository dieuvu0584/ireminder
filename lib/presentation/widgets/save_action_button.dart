import 'package:flutter/material.dart';

/// A more visually prominent stand-in for the plain [TextButton] previously
/// used for "Save" in form AppBars — bold + larger text so it reads as a
/// primary action instead of blending into the title bar.
class SaveActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const SaveActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        child: Text(label),
      ),
    );
  }
}
