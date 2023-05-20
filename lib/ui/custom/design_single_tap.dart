import 'package:flutter/material.dart';

class DesignSingleTap extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onTap;
  final ValueNotifier<bool> isTappedNotifier;

  const DesignSingleTap(
      {super.key,
      required this.onTap,
      required this.isTappedNotifier,
      required this.child});

  @override
  State<DesignSingleTap> createState() => _DesignSingleTapState();
}

class _DesignSingleTapState extends State<DesignSingleTap> {
  void _handleTap() async {
    if (!widget.isTappedNotifier.value) {
      widget.isTappedNotifier.value = true;
      await widget.onTap();
      widget.isTappedNotifier.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.isTappedNotifier,
      builder: (context, isTapped, child) {
        return GestureDetector(
          onTap: _handleTap,
          child: widget.child,
        );
      },
    );
  }
}
