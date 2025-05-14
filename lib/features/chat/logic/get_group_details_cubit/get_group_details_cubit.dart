import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/chat/data/repos/chat_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_group_details_state.dart';
part 'get_group_details_cubit.freezed.dart';

class GetGroupDetailsCubit extends Cubit<GetGroupDetailsState> {
  final ChatRepo _repo;
  GetGroupDetailsCubit(this._repo)
      : super(const GetGroupDetailsState.initial());

  Future<void> getGroupDetails() async {
    emit(const GetGroupDetailsState.getGroupDetailsLoading());
    final result = await _repo.getGroupDetails();
    result.when(
      success: (data) =>
          emit(GetGroupDetailsState.getGroupDetailsSuccess(data)),
      failure: (error) => emit(
          GetGroupDetailsState.getGroupDetailsFailure(error.getAllMessages())),
    );
  }
}
