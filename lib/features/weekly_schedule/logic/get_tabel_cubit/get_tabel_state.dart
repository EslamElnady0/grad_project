part of 'get_tabel_cubit.dart';
@freezed
class GetTabelState<T> with _$GetTabelState {
  const factory GetTabelState.initial() = _Initial;
  const factory GetTabelState.getTabelLoading() = GetTabelLoading;
  const factory GetTabelState.getTabelSuccess(T data) = GetTabelSuccess<T>;
  const factory GetTabelState.getTabelFailure(String error) = GetTabelFailure;
}
