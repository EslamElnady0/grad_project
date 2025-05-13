import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grad_project/features/forum/data/repos/questions_repo.dart';
part 'toggle_like_state.dart';
part 'toggle_like_cubit.freezed.dart';

class ToggleLikeCubit extends Cubit<ToggleLikeState> {
  final QuestionsRepo _repo;

  ToggleLikeCubit(this._repo) : super(const ToggleLikeState.initial());

  Future<void> toggleLike({required String questionId, required String like}) async {
    emit(const ToggleLikeState.toggleLikeLoading());
    final result = await _repo.toggleLike(
      questionId: questionId,
      like: like,
    );

    result.when(
      success: (response) => emit(ToggleLikeState.toggleLikeSuccess(response)),
      failure: (error) => emit(ToggleLikeState.toggleLikeFailure(error.getAllMessages())),
    );
  }
}