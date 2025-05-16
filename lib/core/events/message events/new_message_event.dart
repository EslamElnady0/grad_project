import '../../../features/chat/data/models/get_messages_response.dart';
import 'package:event_bus/event_bus.dart';

final eventBus = EventBus();

class NewMessageEvent {
  final Message message;
  NewMessageEvent(this.message);
}
