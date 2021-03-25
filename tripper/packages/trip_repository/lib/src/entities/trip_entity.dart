import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trip_repository/src/entities/entities.dart';

part 'trip_entity.g.dart';

@JsonSerializable()
class TripEntity extends Equatable {
  const TripEntity({
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
  final PlaceEntity place;
  final String ownerId;
  final List<String> users;
  // List<ViagemItem> Itens;

  @override
  List<Object?> get props => [id, name, startAt, endAt, ownerId, users, place];

  factory TripEntity.fromJson(Map<String, dynamic> json) => _$TripEntityFromJson(json);
  Map<String, dynamic> toJson() => _$TripEntityToJson(this);
}
