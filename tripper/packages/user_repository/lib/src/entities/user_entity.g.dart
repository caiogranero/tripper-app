// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
    id: json['id'] as String,
    nome: json['nome'] as String,
    sobrenome: json['sobrenome'] as String,
    email: json['email'] as String,
    verificado: json['verificado'] as bool,
    nascimento: DateTime.parse(json['nascimento'] as String),
  );
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'verificado': instance.verificado,
      'nascimento': instance.nascimento.toIso8601String(),
    };
