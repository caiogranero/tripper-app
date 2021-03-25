import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.verificado,
    required this.nascimento,
  });

  final String id;
  final String nome;
  final String sobrenome;
  final String email;
  final bool verificado;
  final DateTime nascimento;

  @override
  List<Object> get props => [
        id,
        nome,
        sobrenome,
        email,
        verificado,
        nascimento,
      ];

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
