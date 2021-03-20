import 'package:flutter/material.dart';

class TextFieldGeneric extends StatelessWidget {
  final String labelText;
  final bool obscureText;

  const TextFieldGeneric({
    Key key,
    @required this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
