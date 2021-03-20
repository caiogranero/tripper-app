import 'package:flutter/material.dart';
import 'package:tripper/pages/sign_in.dart';
import 'package:tripper/pages/sign_up.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 20),
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
