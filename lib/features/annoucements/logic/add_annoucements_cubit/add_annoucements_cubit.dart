import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_annoucement_request_body.dart';
import '../../data/repos/annoucements_repo.dart';
part 'add_annoucements_state.dart';
part 'add_annoucements_cubit.freezed.dart';

class AddAnnoucementsCubit extends Cubit<AddAnnoucementsState> {
  final AnnoucementsRepo _repo;
  AddAnnoucementsCubit(this._repo)
      : super(const AddAnnoucementsState.initial());
  Future<void> addAnnoucement({
    required AddAnnouncementRequestBody addAnnouncementRequestBody,
  }) async {
    emit(const AddAnnoucementsState.addAnnoucementsLoading());
    final result = await _repo.addAnnoucement(
      addAnnouncementRequestBody,
    );
    result.when(
      success: (data) {
        emit(AddAnnoucementsState.addAnnoucementsSuccess(data));
      },
      failure: (error) {
        emit(AddAnnoucementsState.addAnnoucementsFailure(
            error.getAllMessages()));
      },
    );
  }
}
