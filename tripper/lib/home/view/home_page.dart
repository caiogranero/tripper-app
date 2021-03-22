import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripper/authentication/authentication.dart';
import 'package:tripper/components/main_button.dart';
import 'package:tripper/home/home.dart';
import 'package:tripper/new_trip/view/view.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 4,
        backgroundColor: Colors.pink,
        title: _HomeTitle(user: user),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _OngoingTrips(),
              _CreateTripButton(),
            ],
          ),
          // child: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     Avatar(photo: user.photo),
          //     const SizedBox(height: 4.0),
          //     Text(user.email, style: textTheme.headline6),
          //     const SizedBox(height: 4.0),
          //     Text(user.name, style: textTheme.headline5),
          //   ],
          // ),
        ),
      ),
    );
  }
}

class _CreateTripButton extends StatefulWidget {
  const _CreateTripButton({Key? key}) : super(key: key);

  @override
  __CreateTripButtonState createState() => __CreateTripButtonState();
}

class __CreateTripButtonState extends State<_CreateTripButton> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MainButton(
      label: "CREATE NEW TRIP",
      onPressed: () => Navigator.push(
        context,
        NewTripPage.route(),
      ),
    );
  }
}

class _OngoingTrips extends StatelessWidget {
  const _OngoingTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("Ongoing trip")],
      ),
    );
  }
}

class _HomeTitle extends StatelessWidget {
  final User user;

  const _HomeTitle({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "My Trips",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Avatar(photo: user.photo),
      ],
    );
  }
}
