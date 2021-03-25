// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripEntity _$TripEntityFromJson(Map<String, dynamic> json) {
  return TripEntity(
    id: json['id'] as String,
    name: json['name'] as String,
    startAt: DateTime.parse(json['startAt'] as String),
    endAt: DateTime.parse(json['endAt'] as String),
    ownerId: json['ownerId'] as String,
    place: PlaceEntity.fromJson(json['place'] as Map<String, dynamic>),
    users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$TripEntityToJson(TripEntity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startAt': instance.startAt.toIso8601String(),
      'endAt': instance.endAt.toIso8601String(),
      'place': instance.place,
      'ownerId': instance.ownerId,
      'users': instance.users,
    };
