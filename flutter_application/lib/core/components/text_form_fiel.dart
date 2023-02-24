import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String inputText;
  FormFieldValidator validator;

  CustomTextFormField({
    super.key,
    required this.inputText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(label: Text(inputText)),
    );
  }
}
