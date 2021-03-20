import 'package:flutter/material.dart';
import 'package:tripper/components/main_button.dart';
import 'package:tripper/components/text_field_generic.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _title(),
        _usernameInput(),
        _emailInput(),
        _passwordInput(),
        _signUpButton(),
      ],
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "New\nAccount",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
          maxLines: 2,
        ),
        Column(
          children: [
            OutlinedButton(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                ),
              ),
              onPressed: () => print("it's pressed"),
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  width: 2.0,
                  color: Color.fromRGBO(30, 90, 255, 1),
                ),
                shape: CircleBorder(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "upload your\nprofile picture",
                style: TextStyle(fontSize: 10, height: 1.5),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _usernameInput() {
    return TextFieldGeneric(
      labelText: 'Username',
    );
  }

  Widget _emailInput() {
    return TextFieldGeneric(
      labelText: 'Email',
    );
  }

  Widget _passwordInput() {
    return TextFieldGeneric(
      labelText: 'Password',
      obscureText: true,
    );
  }

  Widget _signUpButton() {
    return MainButton(
      label: 'Sign up'.toUpperCase(),
      onPressed: () {},
    );
  }
}
