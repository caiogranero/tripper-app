import 'package:flutter/material.dart';

class TextFieldGeneric extends StatelessWidget {
  final String? labelText;
  final bool obscureText;
  final InputDecoration? decoration;
  final Function(String)? onChanged;
  final TextInputType keyboardType;

  const TextFieldGeneric({
    Key? key,
    this.labelText,
    this.decoration,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      decoration: decoration ??
          InputDecoration(
            labelText: labelText,
          ),
      keyboardType: keyboardType,
    );
  }
}
