import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import '../../data/models/add_annoucement_request_body.dart';
import '../../data/repos/annoucements_repo.dart';
part 'update_annoucement_state.dart';
part 'update_annoucement_cubit.freezed.dart';

class UpdateAnnoucementCubit extends Cubit<UpdateAnnoucementState> {
  final AnnoucementsRepo _repo;
  UpdateAnnoucementCubit(this._repo)
      : super(const UpdateAnnoucementState.initial());
  Future<void> updateAnnoucement(Announcement annoucement) async {
    emit(const UpdateAnnoucementState.updateAnnoucementLoading());
    final result = await _repo.updateAnnoucement(
        announcementRequestBody: AnnouncementRequestBody(
          departmentId: annoucement.department.id.toString(),
          semesterId: annoucement.semester.id.toString(),
          courseId: annoucement.course.id.toString(),
          title: annoucement.title,
          body: annoucement.body,
          date: annoucement.date,
          time: annoucement.time,
        ),
        id: annoucement.id.toString());
    result.when(
      success: (data) {
        emit(UpdateAnnoucementState.updateAnnoucementSuccess(data));
      },
      failure: (error) {
        emit(UpdateAnnoucementState.updateAnnoucementFailure(
            error.getAllMessages()));
      },
    );
  }
}
