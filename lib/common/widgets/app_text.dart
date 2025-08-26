import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/util/resource/r.dart';

class AppText extends StatelessWidget {
  const AppText({
    required this.text,
    super.key,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.fontStyle,
    this.textDirection,
    this.textAlign,
    this.textDecoration,
    this.overflow,
    this.maxLines,
    this.height,
    this.decorationColor,
  });

  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final Color? color;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize?.sp ?? 12.sp,
        fontWeight: fontWeight,
        color:
            color ?? R.colors.black000000, // assumes you have R.colors defined
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: decorationColor,
        height: height,
      ),
      textAlign: textAlign,
      textDirection: textDirection ?? TextDirection.ltr,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
