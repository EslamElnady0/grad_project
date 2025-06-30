import '../../../features/chat/data/models/get_messages_response.dart';
import 'package:event_bus/event_bus.dart';

final eventBus = EventBus();

class NewMessageEvent {
  final Message message;
  NewMessageEvent(this.message);
}

class MessageUpdatedEvent {
  final Message message;
  MessageUpdatedEvent(this.message);
}

class UserJoiningEvent {
  final Sender user;
  UserJoiningEvent(this.user);
}
