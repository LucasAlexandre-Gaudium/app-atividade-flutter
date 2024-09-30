import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final Function(String) onChanged;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.placeholder,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.amber,
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        errorText: errorText == '' ? null : errorText,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        errorMaxLines: 2
      ),
      onChanged: onChanged,
    );
  }
}
