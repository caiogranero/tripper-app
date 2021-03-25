import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_entity.g.dart';

@JsonSerializable()
class PlaceEntity extends Equatable {
  const PlaceEntity({
    required this.placeId,
    required this.name,
  });

  final String placeId;
  final String name;

  @override
  List<Object?> get props => [
        placeId,
        name,
      ];

  factory PlaceEntity.fromJson(Map<String, dynamic> json) => _$PlaceEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceEntityToJson(this);
}
