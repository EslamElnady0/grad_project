import 'package:equatable/equatable.dart';

class UserTypingEvent extends Equatable {
  final User user;
  final String type;

  const UserTypingEvent({
    required this.user,
    required this.type,
  });

  @override
  List<Object?> get props => [user, type];
}

class User extends Equatable {
  final int id;
  final String name;
  final String avatar;

  const User({
    required this.id,
    required this.name,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id, name, avatar];
}
