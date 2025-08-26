import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/util/resource/r.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required this.labelText,
    required this.keyboardType,
    this.validator,
    super.key,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.focusNode,
    this.onSaved,
    this.onEditingComplete,
    this.controller,
    this.autofocus = false,
    this.enabled = true,
    this.onChanged,
    this.prefixIcon,
    this.onTap,
    this.minLine = 1,
    this.maxLines = 1,
    this.radius,
    this.inputFormatters,
    this.fillColor = Colors.white,
    this.textInputAction = TextInputAction.next,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.readOnly,
    this.labelColor,
    this.textColor,
    this.suffixIconMaxHeight,
    this.showEditIcon = false,
    this.textCapitalization = TextCapitalization.none,
  });

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final Color? fillColor;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final bool enabled;
  final int maxLines;
  final int minLine;
  final double? radius;
  final bool? readOnly;
  final Color? labelColor;
  final Color? textColor;
  final double? suffixIconMaxHeight;
  final bool showEditIcon;
  final TextCapitalization textCapitalization;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool readOnly = false;

  void onTapEdit() {
    setState(() {
      readOnly = !readOnly;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      readOnly = widget.showEditIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366.w,
      constraints: BoxConstraints(minHeight: 57.h),
      child: TextFormField(
        textCapitalization: widget.textCapitalization,
        onTap: widget.onTap,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChanged,
        autofocus: widget.autofocus,
        enabled: widget.enabled,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        maxLines: widget.maxLines,
        minLines: widget.minLine,
        validator: widget.validator,
        readOnly: widget.readOnly ?? readOnly,
        onSaved: widget.onSaved,
        onEditingComplete: widget.onEditingComplete,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        obscuringCharacter: '●',
        focusNode: widget.focusNode,
        style: TextStyle(
          color: widget.textColor ?? R.colors.black000000,
          fontSize: 16.sp,
        ),
        cursorColor: R.colors.black000000,
        cursorHeight: 20.sp,
        decoration: InputDecoration(
          labelText: widget.labelText, // ✅ now inside the field
          labelStyle: TextStyle(
            color: widget.labelColor ??
                R.colors.black000000.withValues(alpha: 0.5),
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.10.w,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: R.colors.black000000.withValues(alpha: 0.2),
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.12.w,
          ),
          errorStyle: TextStyle(
            fontSize: 12.sp,
            color: R.colors.redFF0000,
          ),
          errorMaxLines: 2,
          filled: true,
          fillColor: widget.fillColor,
          suffixIconConstraints:
              BoxConstraints(maxHeight: widget.suffixIconMaxHeight ?? 24.r),
          prefixIconConstraints: BoxConstraints(maxHeight: 24.r),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.enabledBorderColor ??
                  R.colors.black000000.withValues(alpha: 0.2),
            ),
            borderRadius: BorderRadius.circular((widget.radius ?? 15).r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.focusedBorderColor ?? R.colors.black000000),
            borderRadius: BorderRadius.circular((widget.radius ?? 15).r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: R.colors.redFF0000),
            borderRadius: BorderRadius.circular((widget.radius ?? 15).r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.enabledBorderColor ??
                    R.colors.black000000.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular((widget.radius ?? 15).r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: R.colors.black000000.withValues(alpha: 0.2),
            ),
            borderRadius: BorderRadius.circular((widget.radius ?? 15).r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((widget.radius ?? 15).r),
            borderSide: BorderSide(color: R.colors.black000000),
          ),
          suffixIcon: (widget.showEditIcon && readOnly)
              ? GestureDetector(
                  onTap: () {
                    onTapEdit();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Icon(
                      Icons.edit_outlined,
                      size: 20.sp,
                      color: R.colors.black000000.withValues(alpha: 0.2),
                    ),
                  ),
                )
              : widget.suffixIcon,
        ),
      ),
    );
  }
}
