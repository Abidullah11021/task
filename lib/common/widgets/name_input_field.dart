import 'package:flutter/material.dart';
import 'package:task/common/widgets/custom_text_form_field.dart';

class NameInputField extends StatelessWidget {
  const NameInputField({
    this.onChanged,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.name,
      validator: validator ??
          (value) {
            final RegExp nameRegExp = RegExp(r'^[a-zA-Z\- ]+$');

            if (value?.isEmpty ?? true) {
              return 'Please enter your name';
            }
            if (value!.length > 50) {
              return 'Name cannot exceed 50 characters';
            }
            if (!nameRegExp.hasMatch(value)) {
              return 'Name can only contain letters, spaces, and dashes';
            }
            if (value.contains(RegExp(r'\s{2,}'))) {
              return 'Please enter only one space at a time';
            }

            return null;
          },
      onChanged: onChanged,
    );
  }
}
