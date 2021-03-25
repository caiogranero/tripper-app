import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class User extends Equatable {
  const User({
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

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      nome: nome,
      sobrenome: sobrenome,
      email: email,
      verificado: verificado,
      nascimento: nascimento,
    );
  }

  static User fromEntity(UserEntity entity) {
    return User(
      id: entity.id,
      nome: entity.nome,
      sobrenome: entity.sobrenome,
      email: entity.email,
      verificado: entity.verificado,
      nascimento: entity.nascimento,
    );
  }
}
