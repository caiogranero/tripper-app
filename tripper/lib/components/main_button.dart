import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const MainButton({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 25,
            offset: Offset(0, 10),
            color: Color.fromRGBO(30, 90, 255, 1),
            spreadRadius: -45,
          )
        ],
      ),
      child: TextButton(
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white), // Não deveria precisar colocar isso :)
        ),
        onPressed: onPressed,
      ),
    );
  }
}
