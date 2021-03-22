import 'package:flutter/material.dart';

class NewTripPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => NewTripPage());
  }

  const NewTripPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 4,
        backgroundColor: Colors.pink,
        title: _NewTripTitle(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // _OngoingTrips(),
              // _CreateTripButton(),
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

class _NewTripTitle extends StatelessWidget {
  const _NewTripTitle({Key? key}) : super(key: key);

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
      ],
    );
  }
}
