import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/common/widgets/custom_text_form_field.dart';
import 'package:task/util/resource/r.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    required this.labelText,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.showEditIcon = false,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool showEditIcon;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;

  void onTapIcon() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      showEditIcon: widget.showEditIcon,
      labelText: widget.labelText,
      hintText: widget.hintText,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      validator: widget.validator ??
          (v) {
            if (v?.isEmpty ?? true) {
              return 'Password is required';
            }
            if (v!.length < 8) {
              return 'Password must be at least 8 characters';
            }
            return null;
          },
      onChanged: widget.onChanged,
      prefixIcon: widget.prefixIcon,
      suffixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: InkWell(
          onTap: onTapIcon,
          child: Icon(
            obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 24.r,
            color: obscureText
                ? R.colors.black000000.withValues(alpha: 0.60)
                : R.colors.primary3EB9BB.withValues(alpha: 0.60),
          ),
        ),
      ),
    );
  }
}
