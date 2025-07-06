part of 'dashboard_cubit.dart';
@freezed
class DashboardState<T> with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.dashboardLoading() = DashboardLoading;
  const factory DashboardState.dashboardSuccess(T data) = DashboardSuccess<T>;
  const factory DashboardState.dashboardFailure(String error) = DashboardFailure;
}
