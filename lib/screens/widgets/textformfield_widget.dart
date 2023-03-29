import 'package:flutter/material.dart';
import 'package:moovbe_bus/common/colors.dart';

class TextFormfieldWidegt extends StatelessWidget {
  const TextFormfieldWidegt({
    super.key,
    required this.hintText,
    required this.inputType,
  });
  final String hintText;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
