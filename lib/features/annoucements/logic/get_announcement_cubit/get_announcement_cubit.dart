import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/annoucements/data/repos/annoucements_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_annoucement_request_body.dart';
part 'get_announcement_state.dart';
part 'get_announcement_cubit.freezed.dart';

class GetAnnouncementCubit extends Cubit<GetAnnouncementState> {
  final AnnoucementsRepo _repo;
  GetAnnouncementCubit(this._repo)
      : super(const GetAnnouncementState.initial());

  Future<void> getAnnouncement() async {
    emit(const GetAnnouncementState.getAnnouncementLoading());
    final result = await _repo.getAnnoucements(AnnouncementRequestBody(
      departmentId: "2",
      semesterId: '3',
      courseId: "3",
      title: "title",
      body: "body",
    ));
    result.when(
      success: (data) {
        emit(GetAnnouncementState.getAnnouncementSuccess(data));
      },
      failure: (error) {
        emit(GetAnnouncementState.getAnnouncementFailure(
            error.getAllMessages()));
      },
    );
  }
}
