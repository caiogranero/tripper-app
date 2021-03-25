import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_repository/src/entities/entities.dart';

import 'models/models.dart';

class TripRepository {
  final CollectionReference _tripCollection = FirebaseFirestore.instance.collection('trips');

  Stream<Trip> getById({required String id}) async* {}

  Stream<List<Trip>> listOngoing({required String userId}) {
    return _listByUser(userId: userId).where('startAt', isGreaterThanOrEqualTo: DateTime.now()).snapshots().map(_mapTrip);
  }

  Stream<List<Trip>> listPast({required String userId}) {
    return _listByUser(userId: userId).where('endAt', isLessThanOrEqualTo: DateTime.now()).snapshots().map(_mapTrip);
  }

  Query _listByUser({required String userId}) {
    return _tripCollection.where('users', arrayContains: userId);
  }

  List<Trip> _mapTrip(QuerySnapshot documents) {
    return documents.docs.where((element) => element.exists).map((e) => Trip.fromEntity(TripEntity.fromJson(e.data()!))).toList();
  }
}
