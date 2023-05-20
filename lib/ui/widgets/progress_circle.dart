import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

SizedBox progressAwesome() {
  return const SizedBox(
    height: 26,
    width: 26,
    child: CircularProgressIndicator(
      strokeWidth: 1.5,
    ),
  );
}

class DesignProgress extends StatelessWidget {
  const DesignProgress({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 20,
      width: size ?? 20,
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: color,
      ),
    );
  }
}
