import 'package:flutter/material.dart';
import 'package:moovbe_bus/common/colors.dart';

class TextFormfieldWidegt extends StatelessWidget {
  const TextFormfieldWidegt({
    super.key,
    required this.hintText,
    required this.inputType,
    required this.controller,
    this.validator,
  });
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: inputType,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        filled: true,
        fillColor: AppColor.greyColor,
      ),
    );
  }
}
