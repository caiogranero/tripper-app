import 'package:flutter/material.dart';

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
          _usernameInput(),
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

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const MainButton({
    Key key,
    @required this.label,
    @required this.onPressed,
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
        child: Text(label),
        onPressed: onPressed,
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

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
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                maxLines: 2,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(12)),
          _emailInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _passwordInput(),
          _forgotPassword(),
          const Padding(padding: EdgeInsets.all(22)),
          _signInButton(),
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
      ),
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
