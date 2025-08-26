import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/util/resource/r.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    required this.child,
    super.key,
    this.radius,
    this.color,
    this.padding,
    this.margin,
    this.boxShadow,
    this.width,
    this.height,
    this.borderColor,
    this.borderWidth = 1,
  });

  final Widget child;
  final double? radius;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;
  final Color? borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final baseContainer = Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? R.colors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(radius ?? 12.r),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth,
        ),
        boxShadow: boxShadow,
      ),
      child: child,
    );

    return width == null
        ? IntrinsicWidth(
            child: IntrinsicHeight(
              child: baseContainer,
            ),
          )
        : baseContainer;
  }
}
