import 'package:flutter/material.dart';

class UiCard extends StatelessWidget {
  final Widget? child;
  final Color? cardColor;
  final double? curve;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double maxWidth;
  final BoxConstraints boxConstraints;

  const UiCard({
    super.key,
    this.child,
    this.cardColor,
    this.curve,
    this.elevation = 0,
    this.borderRadius,
    this.borderColor,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.maxWidth = double.infinity,
    this.boxConstraints = const BoxConstraints.tightForFinite(),
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: boxConstraints,
      child: Card(
        margin: margin,
        elevation: elevation,
        color: cardColor ?? Colors.purple.shade50,
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(curve ?? 8.0),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : const BorderSide(color: Colors.purpleAccent)),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
