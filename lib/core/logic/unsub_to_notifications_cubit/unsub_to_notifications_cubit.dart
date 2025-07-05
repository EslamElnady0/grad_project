import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data/repos/sub_to_notification_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'unsub_to_notifications_state.dart';
part 'unsub_to_notifications_cubit.freezed.dart';

class UnsubToNotificationsCubit extends Cubit<UnsubToNotificationsState> {
  final SubToNotificationRepo _repo;
  UnsubToNotificationsCubit(this._repo)
      : super(const UnsubToNotificationsState.initial());

  Future<void> unsubscribe(String deviceToken) async {
    emit(const UnsubToNotificationsState.unsubToNotificationsLoading());
    final response = await _repo.unsubscribe(deviceToken);
    response.when(
      success: (data) {
        emit(const UnsubToNotificationsState.unsubToNotificationsSuccess(null));
      },
      failure: (error) {
        emit(UnsubToNotificationsState.unsubToNotificationsFailure(
            error.getAllMessages()));
      },
    );
  }
}
