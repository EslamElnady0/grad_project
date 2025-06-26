import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/parking_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'parking_state.dart';
part 'parking_cubit.freezed.dart';

class ParkingCubit extends Cubit<ParkingState> {
  final ParkingRepo _repo;
  ParkingCubit(this._repo) : super(const ParkingState.initial());

  Future<void> fetchParkingSlots() async {
    emit(const ParkingState.parkingLoading());
    final result = await _repo.getParkingSlots();
    result.when(
      success: (data) => emit(ParkingState.parkingSuccess(data)),
      failure: (error) =>
          emit(ParkingState.parkingFailure(error.message ?? 'Unknown error')),
    );
  }
}
