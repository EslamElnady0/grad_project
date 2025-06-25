part of 'parking_cubit.dart';
@freezed
class ParkingState<T> with _$ParkingState {
  const factory ParkingState.initial() = _Initial;
  const factory ParkingState.parkingLoading() = ParkingLoading;
  const factory ParkingState.parkingSuccess(T data) = ParkingSuccess<T>;
  const factory ParkingState.parkingFailure(String error) = ParkingFailure;
}
