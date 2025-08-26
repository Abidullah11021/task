import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/common/extensions/num.dart';
import 'package:task/util/resource/r.dart';

class AppFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final double? width;
  final double? height;
  final double? textSize;
  final double? radius;
  final Widget? icon;
  final bool isIconInRight;
  final Color? textColor;
  final double? spaceBetweenIconAndText;

  const AppFilledButton({
    required this.text,
    required this.onTap,
    super.key,
    this.color,
    this.height,
    this.width,
    this.textSize,
    this.radius,
    this.icon,
    this.textColor,
    this.isIconInRight = true,
    this.spaceBetweenIconAndText,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final buttonContent = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: width == null ? MainAxisSize.min : MainAxisSize.max,
      children: [
        if (icon != null && !isIconInRight) ...[
          icon!,
          spaceBetweenIconAndText?.wb ?? 4.wb
        ],
        Text(
          text,
          style: TextStyle(
            color: textColor ?? R.colors.whiteFFFFFF,
            fontSize: textSize ?? 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (icon != null && isIconInRight) ...[
          spaceBetweenIconAndText?.wb ?? 4.wb,
          icon!
        ],
      ],
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: R.colors.blue0000FF,
        borderRadius: BorderRadius.circular(radius ?? 15.r),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 2,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 15.r),
          ),
          shadowColor: Colors.transparent,
          minimumSize: Size(
            width?.w ?? 0,
            height?.h ?? 55.h,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w), // content padding
          child: SizedBox(
            height: height?.h ?? 55.h,
            width: width?.w,
            child: Center(child: buttonContent),
          ),
        ),
      ),
    );
  }
}
