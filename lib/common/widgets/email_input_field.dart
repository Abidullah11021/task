import 'package:flutter/material.dart';
import 'package:task/common/widgets/custom_text_form_field.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    required this.labelText,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.validator,
    this.enabled = true,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.showEditIcon = false,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enabled;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool showEditIcon;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      showEditIcon: showEditIcon,
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      enabledBorderColor: enabledBorderColor,
      focusedBorderColor: focusedBorderColor,
      enabled: enabled,
      keyboardType: TextInputType.emailAddress,
      validator: validator ??
          (v) {
            if (v?.isEmpty ?? false) {
              return 'Email is required';
            }

            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v!)) {
              return 'Please enter a valid email address.';
            }

            return null;
          },
      onChanged: onChanged,
    );
  }
}
