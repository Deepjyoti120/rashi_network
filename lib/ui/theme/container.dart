import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/viewmodel/darkmode_state.dart';

class DesignContainer extends ConsumerWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final double? allBorderRadius, allPadding, allMargin, blurRadius;
  final EdgeInsetsGeometry? padding, margin;
  final Color? color;
  final Color? blurRadiuscolor;
  final Color? borderAllColor;
  final bool isColor;
  final bool bordered;
  final Border? border;
  final Clip? clipBehavior;
  final BoxShape shape;
  final double? width, height;
  final AlignmentGeometry? alignment;
  final bool enableBorderRadius;

  const DesignContainer({
    Key? key,
    required this.child,
    this.borderRadius,
    this.padding,
    this.allBorderRadius,
    this.allPadding,
    this.border,
    this.bordered = false,
    this.isColor = false,
    this.clipBehavior,
    this.color,
    this.blurRadiuscolor,
    this.shape = BoxShape.rectangle,
    this.width,
    this.height,
    this.alignment,
    this.enableBorderRadius = true,
    this.allMargin,
    this.margin,
    this.borderAllColor,
    this.blurRadius,
  }) : super(key: key);

  const DesignContainer.none({
    Key? key,
    required this.child,
    this.borderRadius,
    this.padding,
    this.allBorderRadius = 0,
    this.allPadding = 0,
    this.border,
    this.bordered = false,
    this.isColor = false,
    this.clipBehavior,
    this.enableBorderRadius = true,
    this.color,
    this.shape = BoxShape.rectangle,
    this.width,
    this.blurRadiuscolor,
    this.height,
    this.alignment,
    this.allMargin,
    this.margin,
    this.borderAllColor,
    this.blurRadius,
  }) : super(key: key);

  const DesignContainer.bordered({
    Key? key,
    required this.child,
    this.borderRadius,
    this.padding,
    this.allBorderRadius,
    this.allPadding,
    this.border,
    this.blurRadiuscolor,
    this.bordered = true,
    this.isColor = false,
    this.enableBorderRadius = true,
    this.clipBehavior,
    this.color,
    this.shape = BoxShape.rectangle,
    this.width,
    this.height,
    this.alignment,
    this.allMargin,
    this.margin,
    this.borderAllColor,
    this.blurRadius,
  }) : super(key: key);

  const DesignContainer.roundBordered({
    Key? key,
    required this.child,
    this.blurRadiuscolor,
    this.borderRadius,
    this.padding,
    this.allBorderRadius,
    this.enableBorderRadius = true,
    this.allPadding,
    this.border,
    this.bordered = true,
    this.isColor = false,
    this.clipBehavior,
    this.color,
    this.shape = BoxShape.circle,
    this.width,
    this.height,
    this.alignment, 
    this.allMargin,
    this.margin,
    this.borderAllColor,
    this.blurRadius,
  }) : super(key: key);

  const DesignContainer.rounded({
    Key? key,
    required this.child,
    this.borderRadius,
    this.padding,
    this.allBorderRadius,
    this.enableBorderRadius = true,
    this.allPadding,
    this.border,
    this.bordered = false,
    this.blurRadiuscolor,
    this.isColor = false,
    this.clipBehavior = Clip.antiAliasWithSaveLayer,
    this.color,
    this.shape = BoxShape.circle,
    this.width,
    this.height,
    this.alignment,
    this.allMargin,
    this.margin,
    this.borderAllColor,
    this.blurRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeRef);
    Widget container = Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: margin ?? EdgeInsets.all(allMargin ?? 0),
      decoration: BoxDecoration(
          boxShadow: blurRadius != null
              ? [
                  BoxShadow(
                    color: blurRadiuscolor ?? Colors.black.withOpacity(0.09),
                    blurRadius: blurRadius ?? 12.0,
                  ),
                ]
              : null,
          color: isColor
              ? color
              : darkMode.isDark
                  ? DesignColor.blackCard
                  : const Color(0xffffffff),
          shape: shape,
          borderRadius: enableBorderRadius
              ? (shape == BoxShape.rectangle
                  ? borderRadius ??
                      BorderRadius.all(Radius.circular(allBorderRadius ?? 6))
                  : null)
              : null,
          border: bordered
              ? border ??
                  Border.all(color: borderAllColor ?? Colors.blue, width: 1)
              : null),
      padding: padding ?? EdgeInsets.all(allPadding ?? 16),
      clipBehavior: clipBehavior ?? Clip.none,
      child: child,
    );
    return container;
  }
}
