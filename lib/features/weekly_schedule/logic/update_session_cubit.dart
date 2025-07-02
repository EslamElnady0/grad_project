import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/weekly_schedule/data/models/update_session_request_model.dart';
import 'package:grad_project/features/weekly_schedule/data/repos/get_tabel_repo.dart';
import 'package:grad_project/features/weekly_schedule/data/repositories/weekly_schedule_repository.dart';
import 'package:grad_project/features/weekly_schedule/logic/update_session_state.dart';

class UpdateSessionCubit extends Cubit<UpdateSessionState> {
  final GetTabelRepo _repository;

  UpdateSessionCubit(this._repository) : super(const UpdateSessionInitial());

  Future<void> updateSession(
    int sessionId,
    UpdateSessionRequestModel requestModel,
  ) async {
    emit(const UpdateSessionLoading());
    try {
      final response = await _repository.updateSession(sessionId, requestModel);
      emit(UpdateSessionSuccess(response));
    } catch (error) {
      emit(UpdateSessionError(error.toString()));
    }
  } 
}
