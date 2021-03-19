import 'package:flutter/material.dart';
import 'dart:math';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height / 4,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Sign in'),
                Tab(text: 'Sign up'),
              ],
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 0.25,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              labelColor: Colors.white,
              indicatorWeight: 5,
              indicatorColor: Color.fromRGBO(30, 90, 255, 1),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: TabBarView(
              children: [
                SignInPage(),
                SignUpPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
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
          ),
          const Padding(padding: EdgeInsets.all(12)),
          _emailInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _passwordInput(),
          const Padding(padding: EdgeInsets.all(22)),
          _signUpButton(),
        ],
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

  Widget _signUpButton() {
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
          child: Text('Sign up'.toUpperCase()),
          onPressed: () {},
        ));
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

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
