import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/models.dart';

class UserRepository {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  // Stream<User?> getUser({required String userId}) {
  //   // return userCollection.doc(userId).snapshots().map((event) => {});
  //   // return _listByUser(userId: userId).where('startAt', isGreaterThanOrEqualTo: DateTime.now()).snapshots().map((event) {
  //   //   return event.docs.map(_mapTrip).toList();
  //   // });
  // }
}
