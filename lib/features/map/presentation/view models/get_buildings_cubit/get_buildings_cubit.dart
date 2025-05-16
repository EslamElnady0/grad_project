import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/map/data/repos/halls_and_buildings_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_buildings_state.dart';
part 'get_buildings_cubit.freezed.dart';

class GetBuildingsCubit extends Cubit<GetBuildingsState> {
  final HallsAndBuildingsRepo _repo;
  GetBuildingsCubit(this._repo) : super(const GetBuildingsState.initial());

  Future<void> getBuildings() async {
    emit(const GetBuildingsState.getBuildingsLoading());
    final result = await _repo.getBuildings();
    result.when(success: (buildingsResponse) {
      emit(GetBuildingsState.getBuildingsSuccess(buildingsResponse));
    }, failure: (apiErrorModel) {
      emit(GetBuildingsState.getBuildingsFailure(
          apiErrorModel.getAllMessages()));
    });
  }
}
