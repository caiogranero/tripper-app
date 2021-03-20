import 'package:flutter/material.dart';
import 'package:tripper/components/main_button.dart';
import 'package:tripper/components/text_field_generic.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _title(),
          _emailInput(),
          _password(),
          _signInButton(),
          _signInWithSocial(),
        ],
      ),
    );
  }

  Widget _signInWithSocial() {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "or sign in with",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.face),
            Icon(Icons.report_gmailerrorred_outlined)
          ],
        ),
      ],
    );
  }

  Widget _password() {
    return Column(
      children: [
        _passwordInput(),
        _forgotPassword(),
      ],
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Login",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
          maxLines: 2,
        ),
      ],
    );
  }

  Widget _forgotPassword() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(30, 90, 255, 1),
            ),
          ),
          onTap: () {
            print("Forgot password");
          },
        ),
      ),
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

  Widget _signInButton() {
    return MainButton(
      label: 'Sign in'.toUpperCase(),
      onPressed: () {},
    );
  }
}
