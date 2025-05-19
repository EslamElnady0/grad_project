import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repos/halls_and_buildings_repo.dart';
part 'get_halls_state.dart';
part 'get_halls_cubit.freezed.dart';

class GetHallsCubit extends Cubit<GetHallsState> {
  final HallsAndBuildingsRepo _repo;
  GetHallsCubit(this._repo) : super(const GetHallsState.initial());

  Future<void> getHalls() async {
    emit(const GetHallsState.getHallsLoading());
    final result = await _repo.getHalls();
    result.when(success: (hallsResponse) {
      emit(GetHallsState.getHallsSuccess(hallsResponse));
    }, failure: (apiErrorModel) {
      emit(GetHallsState.getHallsFailure(apiErrorModel.getAllMessages()));
    });
  }
}
