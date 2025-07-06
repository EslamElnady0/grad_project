import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/dashboard_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepo _repo;
  String? _currentCourseId;

  DashboardCubit(this._repo) : super(const DashboardState.initial());

  Future<void> getCourseStudents(String courseId) async {
    _currentCourseId = courseId;
    emit(const DashboardState.dashboardLoading());
    final result = await _repo.getCourseStudents(courseId);
    result.when(
      success: (data) => emit(DashboardState.dashboardSuccess(data)),
      failure: (error) =>
          emit(DashboardState.dashboardFailure(error.getAllMessages())),
    );
  }

  Future<void> refresh() async {
    if (_currentCourseId != null) {
      await getCourseStudents(_currentCourseId!);
    }
  }
}
