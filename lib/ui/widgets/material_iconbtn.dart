import 'package:flutter/material.dart';

class MaterialIconButton extends StatelessWidget {
  const MaterialIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.borderRadius,
  });
  final void Function()? onPressed;
  final Widget icon;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius ?? 60),
      clipBehavior: Clip.antiAlias,
      // color: Colors.transparent,
      child: IconButton(
        constraints: const BoxConstraints(),
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
