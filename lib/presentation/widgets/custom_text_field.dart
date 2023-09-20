import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final TextInputType inputType;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.obscureText = false,
      this.inputType = TextInputType.text,
      this.onChanged,
      this.suffixIcon, 
      this.textInputAction=TextInputAction.next
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      textInputAction: textInputAction,
      validator: (value) {
        if (value == null && value!.isEmpty) {
          return 'Please enter';
        }
        return null;
      },
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
