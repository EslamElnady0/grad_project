import 'package:equatable/equatable.dart';
import 'package:grad_project/features/chat/data/models/get_messages_response.dart';

class UserTypingEvent extends Equatable {
  final Sender user;
  final String type;

  const UserTypingEvent({
    required this.user,
    required this.type,
  });

  @override
  List<Object?> get props => [user, type];
}
