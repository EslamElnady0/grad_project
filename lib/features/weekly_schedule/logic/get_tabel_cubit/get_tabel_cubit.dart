import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/get_tabel_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_tabel_state.dart';
part 'get_tabel_cubit.freezed.dart';
class GetTabelCubit extends Cubit<GetTabelState> {
  final GetTabelRepo _repo;
  GetTabelCubit(this._repo) : super(const GetTabelState.initial());


   Future<void> getTable() async {
    emit(const GetTabelState.getTabelLoading());
    final result = await _repo.getTable();

    result.when(
      success: (data) {
        emit(GetTabelState.getTabelSuccess(data));
      },
      failure: (error) {
        emit(GetTabelState.getTabelFailure(error.getAllMessages()));
      },
    );
  }
}
