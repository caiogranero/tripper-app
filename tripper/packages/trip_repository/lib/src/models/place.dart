import 'package:equatable/equatable.dart';
import 'package:trip_repository/src/entities/entities.dart';

class Place extends Equatable {
  const Place({required this.placeId, required this.name});

  final String placeId;
  final String name;

  @override
  List<Object?> get props => [placeId, name];

  PlaceEntity toEntity() {
    return PlaceEntity(
      placeId: placeId,
      name: name,
    );
  }

  static Place fromEntity(PlaceEntity entity) {
    return Place(
      placeId: entity.placeId,
      name: entity.name,
    );
  }
}
