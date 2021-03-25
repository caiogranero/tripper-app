import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trip_repository/trip_repository.dart';
part 'trips_event.dart';
part 'trips_state.dart';

class TripsBloc extends Bloc<TripsEvent, TripsState> {
  final TripRepository _tripsRepository;
  final AuthenticationRepository _authenticationRepository;

  StreamSubscription? tripsStream;

  TripsBloc()
      : _tripsRepository = GetIt.I<TripRepository>(),
        _authenticationRepository = GetIt.I<AuthenticationRepository>(),
        super(TripsLoading());

  @override
  Stream<TripsState> mapEventToState(
    TripsEvent event,
  ) async* {
    if (event is LoadTrips) {
      yield* _mapLoadTripsToState();
    } else if (event is TripsUpdated) {
      yield* _mapTripsUpdatedToState(event);
    }
  }

  Stream<TripsState> _mapLoadTripsToState() async* {
    var _ongoingTrips = _tripsRepository.listOngoing(userId: _authenticationRepository.userId);
    var _pastTrips = _tripsRepository.listPast(userId: _authenticationRepository.userId);

    tripsStream?.cancel();
    tripsStream = Rx.combineLatest2(_ongoingTrips, _pastTrips, (List<Trip> ongoingTrips, List<Trip> pastTrips) {
      return TripsUpdated(ongoingTrips: ongoingTrips, pastTrips: pastTrips);
    }).listen((TripsUpdated event) {
      add(event);
    });
  }

  Stream<TripsState> _mapTripsUpdatedToState(TripsUpdated event) async* {
    yield TripsLoaded(
      ongoingTrips: event.ongoingTrips,
      pastTrips: event.pastTrips,
    );
  }
}
