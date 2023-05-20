import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rashi_network/ui/theme/text.dart';

class DesignButtons extends StatefulWidget {
  final Future<void> Function() onPressed;
  final ValueNotifier<bool> isTappedNotifier;
  // final Function onPressed;
  final String textLabel;
  final Widget? icon;
  final Widget? child;
  final double? fontSize;
  final Color? color;
  final Color? colorText;
  final Color? colorBorderSide;
  final double bottomLeft;
  final double bottomRight;
  final double topLeft;
  final double topRight;
  final bool elevated;
  final double? pdleft;
  final double? pdtop;
  final double? pdright;
  final double? pdbottom;
  final double? sideWidth;
  final bool borderSide;
  final bool onlyText;
  final double? elevation;
  final int? fontWeight;
  const DesignButtons({
    Key? key,
    required this.onPressed,
    required this.textLabel,
    this.icon,
    this.child,
    this.fontSize,
    this.color,
    this.colorText,
    this.bottomLeft = 4,
    this.bottomRight = 4,
    this.topLeft = 4,
    this.topRight = 4,
    this.elevated = false,
    this.pdleft,
    this.pdtop,
    this.pdright,
    this.pdbottom,
    this.sideWidth,
    this.colorBorderSide,
    this.borderSide = false,
    this.onlyText = true,
    this.elevation,
    this.fontWeight,
    // required this.onTap,
    required this.isTappedNotifier,
  }) : super(key: key);
  const DesignButtons.icon({
    Key? key,
    required this.onPressed,
    required this.textLabel,
    this.icon,
    this.child,
    this.fontSize,
    this.color,
    this.colorText,
    this.bottomLeft = 4,
    this.bottomRight = 4,
    this.topLeft = 4,
    this.topRight = 4,
    this.elevated = false,
    this.pdleft,
    this.pdtop,
    this.pdright,
    this.pdbottom,
    this.sideWidth,
    this.colorBorderSide,
    this.borderSide = false,
    this.onlyText = false,
    this.elevation,
    this.fontWeight,
    // required this.onTap,
    required this.isTappedNotifier,
  }) : super(key: key);
  const DesignButtons.elevated({
    Key? key,
    required this.onPressed,
    required this.textLabel,
    this.icon,
    this.child,
    this.fontSize,
    this.color,
    this.colorText,
    this.bottomLeft = 4,
    this.bottomRight = 4,
    this.topLeft = 4,
    this.topRight = 4,
    this.elevated = true,
    this.pdleft,
    this.pdtop,
    this.pdright,
    this.pdbottom,
    this.sideWidth,
    this.colorBorderSide,
    this.borderSide = false,
    this.onlyText = true,
    this.elevation,
    this.fontWeight,
    // required this.onTap,
    required this.isTappedNotifier,
  }) : super(key: key);
  const DesignButtons.elevatedIcon({
    Key? key,
    required this.onPressed,
    required this.textLabel,
    this.icon,
    this.child,
    this.fontSize,
    this.color,
    this.colorText,
    this.bottomLeft = 4,
    this.bottomRight = 4,
    this.topLeft = 4,
    this.topRight = 4,
    this.elevated = true,
    this.pdleft,
    this.pdtop,
    this.pdright,
    this.pdbottom,
    this.sideWidth,
    this.colorBorderSide,
    this.borderSide = false,
    this.onlyText = false,
    this.elevation,
    this.fontWeight,
    // required this.onTap,
    required this.isTappedNotifier,
  }) : super(key: key);

  @override
  State<DesignButtons> createState() => _DesignButtonsState();
}

class _DesignButtonsState extends State<DesignButtons> {
  // final isTappedNotifier = ValueNotifier<bool>(false);
  void _handleTap() async {
    if (kDebugMode) {
      print('1stt out ${widget.isTappedNotifier.value}');
    }
    if (!widget.isTappedNotifier.value) {
      widget.isTappedNotifier.value = true;
      await widget.onPressed();
      widget.isTappedNotifier.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.elevated) {
      if (!widget.onlyText) {
        return ValueListenableBuilder<bool>(
            valueListenable: widget.isTappedNotifier,
            builder: (context, isTapped, child) {
              return TextButton.icon(
                style: TextButton.styleFrom(
                    elevation: widget.elevation,
                    backgroundColor:
                        widget.color ?? Colors.blue.withOpacity(0.2),
                    padding: EdgeInsets.fromLTRB(
                        widget.pdleft ?? 4,
                        widget.pdtop ?? 0,
                        widget.pdright ?? 4,
                        widget.pdbottom ?? 0),
                    shape: widget.borderSide
                        ? RoundedRectangleBorder(
                            side: BorderSide(
                              color: widget.colorBorderSide ?? Colors.blue,
                              width: widget.sideWidth ?? 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          )
                        : null),
                icon: widget.icon ?? const Icon(Icons.abc),
                onPressed: isTapped ? null : _handleTap,
                label: widget.child ??
                    DesignText.bold2(
                      widget.textLabel,
                      color: widget.colorText,
                      isDesignButton: true,
                      fontWeight: widget.fontWeight ?? 800,
                      fontSize: widget.fontSize,
                    ),
              );
            });
      } else {
        return ValueListenableBuilder<bool>(
            valueListenable: widget.isTappedNotifier,
            builder: (context, isTapped, child) {
              return TextButton(
                style: TextButton.styleFrom(
                    elevation: widget.elevation,
                    backgroundColor:
                        widget.color ?? Colors.blue.withOpacity(0.2),
                    padding: EdgeInsets.fromLTRB(
                        widget.pdleft ?? 4,
                        widget.pdtop ?? 0,
                        widget.pdright ?? 4,
                        widget.pdbottom ?? 0),
                    shape: widget.borderSide
                        ? RoundedRectangleBorder(
                            side: BorderSide(
                              color: widget.colorBorderSide ?? Colors.blue,
                              width: widget.sideWidth ?? 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          )
                        : null),
                onPressed: isTapped ? null : _handleTap,
                child: widget.child ??
                    DesignText.bold2(
                      widget.textLabel,
                      color: widget.colorText,
                      isDesignButton: true,
                      fontWeight: widget.fontWeight ?? 800,
                      fontSize: widget.fontSize,
                    ),
              );
            });
      }
    } else {
      if (widget.onlyText) {
        return ValueListenableBuilder<bool>(
            valueListenable: widget.isTappedNotifier,
            builder: (context, isTapped, child) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(
                      widget.pdleft ?? 19,
                      widget.pdtop ?? 18,
                      widget.pdright ?? 19,
                      widget.pdbottom ?? 18),
                  backgroundColor: widget.color,
                  elevation: widget.elevation,
                  minimumSize: Size.zero,
                  shape: widget.borderSide
                      ? RoundedRectangleBorder(
                          side: BorderSide(
                            color: widget.colorBorderSide ?? Colors.blue,
                            width: widget.sideWidth ?? 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(widget.bottomLeft),
                            bottomRight: Radius.circular(widget.bottomRight),
                            topLeft: Radius.circular(widget.topLeft),
                            topRight: Radius.circular(widget.topRight),
                          ),
                        )
                      : null,
                ),
                onPressed: isTapped ? null : _handleTap,
                child: widget.child ??
                    DesignText.bold2(
                      widget.textLabel,
                      fontWeight: widget.fontWeight ?? 700,
                      iscolor: true,
                      fontSize: widget.fontSize,
                      isDesignButton: true,
                      color: widget.colorText ?? Colors.white,
                      textAlign: TextAlign.center,
                    ),
              );
            });
      } else {
        return ValueListenableBuilder<bool>(
            valueListenable: widget.isTappedNotifier,
            builder: (context, isTapped, child) {
              return ElevatedButton.icon(
                icon: widget.icon ?? const Icon(Icons.abc),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(
                      widget.pdleft ?? 19,
                      widget.pdtop ?? 18,
                      widget.pdright ?? 19,
                      widget.pdbottom ?? 18),
                  backgroundColor: widget.color,
                  elevation: widget.elevation,
                  shape: widget.borderSide
                      ? RoundedRectangleBorder(
                          side: BorderSide(
                            color: widget.colorBorderSide ?? Colors.blue,
                            width: widget.sideWidth ?? 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(widget.bottomLeft),
                            bottomRight: Radius.circular(widget.bottomRight),
                            topLeft: Radius.circular(widget.topLeft),
                            topRight: Radius.circular(widget.topRight),
                          ),
                        )
                      : null,
                ),
                onPressed: isTapped ? null : _handleTap,
                label: widget.child ??
                    DesignText.bold2(
                      widget.textLabel,
                      fontWeight: widget.fontWeight ?? 700,
                      iscolor: true,
                      fontSize: widget.fontSize,
                      isDesignButton: true,
                      color: widget.colorText ?? Colors.white,
                      textAlign: TextAlign.center,
                    ),
              );
            });
      }
    }
  }
}
