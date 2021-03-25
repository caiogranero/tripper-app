part of 'trips_bloc.dart';

abstract class TripsState extends Equatable {
  const TripsState();

  @override
  List<Object> get props => [];
}

class TripsLoading extends TripsState {}

class TripsLoaded extends TripsState {
  final List<Trip> ongoingTrips;
  final List<Trip> pastTrips;

  const TripsLoaded({
    required this.ongoingTrips,
    required this.pastTrips,
  });

  @override
  List<Object> get props => [
        ongoingTrips,
        pastTrips,
      ];
}
