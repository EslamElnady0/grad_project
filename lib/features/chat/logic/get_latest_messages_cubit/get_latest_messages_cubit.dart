import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/chat/data/models/get_messages_response.dart';
import 'package:grad_project/features/chat/data/repos/chat_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/events/message events/messages_events.dart';
part 'get_latest_messages_state.dart';
part 'get_latest_messages_cubit.freezed.dart';

class GetLatestMessagesCubit extends Cubit<GetLatestMessagesState> {
  final ChatRepo _repo;
  final StreamController<List<Message>> _messagesStreamController =
      StreamController.broadcast();
  StreamSubscription? _messageSubscription;
  StreamSubscription? _messageSeenSubscription;
  StreamSubscription? _userJoinedSubscription;

  GetLatestMessagesCubit(this._repo)
      : super(const GetLatestMessagesState.initial()) {
    _messageSubscription = eventBus.on<NewMessageEvent>().listen((event) {
      addMessage(event.message);
    });
    _messageSeenSubscription =
        eventBus.on<MessageUpdatedEvent>().listen((event) {
      updateMessage(event.message);
    });

    _userJoinedSubscription = eventBus.on<UserJoiningEvent>().listen((event) {
      userJoined(event.user);
    });
  }

  List<Message> messagesList = [];

  Stream<List<Message>> get messagesStream => _messagesStreamController.stream;

  /// execute open chat to mark all messages as seen and get latest messages
  Future<void> getLatestMessages() async {
    emit(const GetLatestMessagesState.getLatestMessagesLoading());
    _repo.openChat(
      onSuccess: (data) {},
      onFailure: (error) => emit(GetLatestMessagesFailure(error)),
    );
    final result = await _repo.getLatestMessages();
    result.when(
      success: (data) {
        messagesList = data.data;
        _messagesStreamController.add(messagesList);
        emit(GetLatestMessagesState.getLatestMessagesSuccess(data));
      },
      failure: (error) => emit(GetLatestMessagesState.getLatestMessagesFailure(
          error.getAllMessages())),
    );
  }

  Future<void> getOlder30Messages() async {
    _isPaginating = true;
    emit(const GetLatestMessagesState.getLatestMessagesLoading());

    final result = await _repo.getOlder30Messages(messagesList.last.id);

    result.when(
      success: (data) {
        List<Message> olderMessages = data.data;
        messagesList = messagesList + olderMessages;
        _messagesStreamController.add(messagesList);
        emit(GetLatestMessagesState.getLatestMessagesSuccess(data));
      },
      failure: (error) => emit(GetLatestMessagesState.getLatestMessagesFailure(
          error.getAllMessages())),
    );

    _isPaginating = false;
  }

  bool get isPaginating => _isPaginating;
  bool _isPaginating = false;

  void addMessage(Message newMsg) {
    messagesList.insert(0, newMsg);
    _messagesStreamController.add(messagesList);
  }

  void updateMessage(Message message) {
    messagesList.firstWhere((element) => element.id == message.id).status =
        message.status;
    _messagesStreamController.add(List.from(messagesList));
  }

  void userJoined(Sender user) {
    for (Message message in messagesList) {
      if (!message.status.seenBy.contains(user)) {
        message.status.seenBy.add(user);
      }
      if (!message.status.deliveredTo.contains(user)) {
        message.status.seenBy.add(user);
      }
    }
    _messagesStreamController.add(List.from(messagesList));
  }

  @override
  Future<void> close() {
    _messagesStreamController.close();
    _messageSubscription?.cancel();
    _messageSeenSubscription?.cancel();
    _userJoinedSubscription?.cancel();
    return super.close();
  }
}
