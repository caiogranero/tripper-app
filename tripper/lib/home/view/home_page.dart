import 'package:authentication_repository/authentication_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trip_repository/trip_repository.dart';
import 'package:tripper/authentication/authentication.dart';
import 'package:tripper/components/main_button.dart';
import 'package:tripper/home/bloc/trips_bloc.dart';
import 'package:tripper/home/home.dart';
import 'package:tripper/new_trip/view/view.dart';
import 'package:tripper/theme.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _HomeTitle(user: user),
      ),
      body: BlocProvider<TripsBloc>(
        create: (context) => TripsBloc()..add(LoadTrips()),
        child: _HomePageView(),
      ),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsBloc, TripsState>(builder: (context, state) {
      if (state is TripsLoaded) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Align(
            alignment: const Alignment(0, -1 / 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _OngoingTrips(trips: state.ongoingTrips),
                const Padding(padding: EdgeInsets.only(top: 25)),
                _CreateTripButton(),
              ],
            ),
          ),
        );
      } else {
        return Container(
          child: Text("Carregando..."),
        );
      }
    });
  }
}

class _NoTripsFounded extends StatelessWidget {
  const _NoTripsFounded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/4056364.jpg', height: 250),
          // Text("Organize sua primeira viagem!"),
        ],
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
  @override
  Widget build(BuildContext context) {
    return MainButton(
      label: "Começar uma nova viagem",
      onPressed: () => Navigator.push(
        context,
        NewTripPage.route(),
      ),
    );
  }
}

class _OngoingTrips extends StatelessWidget {
  final List<Trip> trips;

  const _OngoingTrips({
    Key? key,
    required this.trips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ongoing trip",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          if (trips.length == 0) Align(alignment: Alignment.center, child: _NoTripsFounded()),
          if (trips.length > 0) _OngoingTripsCarousel(trips: trips),
        ],
      ),
    );
  }
}

class _OngoingTripsCarousel extends StatelessWidget {
  final List<Trip> trips;

  const _OngoingTripsCarousel({
    Key? key,
    required this.trips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: trips.length,
      itemBuilder: (BuildContext context, int itemIndex, int i) {
        return _OngoingTripItem(trip: trips[i]);
      },
      options: CarouselOptions(
        autoPlay: false,
        enableInfiniteScroll: false,
        height: trips.length != 0 ? 230 : 0,
        viewportFraction: 0.99,
        initialPage: 0,
      ),
    );
  }
}

class _OngoingTripItem extends StatelessWidget {
  final Trip trip;

  const _OngoingTripItem({
    Key? key,
    required this.trip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      borderOnForeground: false,
      elevation: 10,
      shadowColor: Colors.black54,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 150,
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trip.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  trip.place.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: CustomColors.mainColorSoft,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${DateFormat.yMMMM().format(trip.startAt)} - ${DateFormat.yMMMM().format(trip.endAt)}",
                  // "14 Feb - 18 Feb",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: CustomColors.mainColorSoft,
                  ),
                ),
                Avatar(avatarSize: 8)
              ],
            ),
          ],
        ),
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
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Avatar(photo: user.photo),
      ],
    );
  }
}
