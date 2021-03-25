part of 'trips_bloc.dart';

abstract class TripsEvent extends Equatable {
  const TripsEvent();

  @override
  List<Object> get props => [];
}

class LoadTrips extends TripsEvent {
  const LoadTrips();
}

class TripsUpdated extends TripsEvent {
  final List<Trip> ongoingTrips;
  final List<Trip> pastTrips;

  const TripsUpdated({
    required this.ongoingTrips,
    required this.pastTrips,
  });

  @override
  List<Object> get props => [
        ongoingTrips,
        pastTrips,
      ];
}
