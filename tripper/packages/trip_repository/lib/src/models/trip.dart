import 'package:equatable/equatable.dart';
import 'package:trip_repository/src/entities/entities.dart';
import 'package:trip_repository/src/models/place.dart';

class Trip extends Equatable {
  const Trip({
    required this.id,
    required this.name,
    required this.startAt,
    required this.endAt,
    required this.ownerId,
    required this.place,
    this.users = const [],
  });

  final String id;
  final String name;
  final DateTime startAt;
  final DateTime endAt;
  final Place place;
  final String ownerId;
  final List<String> users;
  // List<ViagemItem> Itens;

  @override
  List<Object?> get props => [id, name, startAt, endAt, ownerId, users, place];

  TripEntity toEntity() {
    return TripEntity(
      id: id,
      name: name,
      endAt: endAt,
      ownerId: ownerId,
      place: place.toEntity(),
      startAt: startAt,
      users: users,
    );
  }

  static Trip fromEntity(TripEntity entity) {
    return Trip(
      id: entity.id,
      endAt: entity.endAt,
      name: entity.name,
      ownerId: entity.ownerId,
      place: Place.fromEntity(entity.place),
      startAt: entity.startAt,
      users: entity.users,
    );
  }
}
