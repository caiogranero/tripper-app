import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripper/login/login.dart';
import 'package:tripper/sign_up/sign_up.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

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
                BlocProvider(
                  create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
                  child: LoginForm(),
                ),
                BlocProvider<SignUpCubit>(
                  create: (_) => SignUpCubit(context.read<AuthenticationRepository>()),
                  child: SignUpForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
