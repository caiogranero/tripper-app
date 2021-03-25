// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceEntity _$PlaceEntityFromJson(Map<String, dynamic> json) {
  return PlaceEntity(
    placeId: json['placeId'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$PlaceEntityToJson(PlaceEntity instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'name': instance.name,
    };
