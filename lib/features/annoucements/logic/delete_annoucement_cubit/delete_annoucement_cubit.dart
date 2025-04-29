import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repos/annoucements_repo.dart';
part 'delete_annoucement_state.dart';
part 'delete_annoucement_cubit.freezed.dart';

class DeleteAnnoucementCubit extends Cubit<DeleteAnnoucementState> {
  final AnnoucementsRepo _repo;
  DeleteAnnoucementCubit(this._repo)
      : super(const DeleteAnnoucementState.initial());

  Future<void> deleteAnnoucement(String id) async {
    emit(const DeleteAnnoucementState.deleteAnnoucementLoading());
    final result = await _repo.deleteAnnoucement(annoucementId: id);
    result.when(
      success: (data) {
        emit(DeleteAnnoucementState.deleteAnnoucementSuccess(data));
      },
      failure: (apiErrorModel) {
        emit(DeleteAnnoucementFailure(apiErrorModel.getAllMessages()));
      },
    );
  }
}
