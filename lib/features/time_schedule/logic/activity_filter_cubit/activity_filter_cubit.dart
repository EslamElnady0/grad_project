import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/features/time_schedule/logic/activity_filter_cubit/activity_filter_state.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_state.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_state.dart';
import 'package:grad_project/generated/l10n.dart';

class ActivityFilterCubit extends Cubit<ActivityFilterState> {
  ActivityFilterCubit() : super(const ActivityFilterInitialState());

  void filterActivities(List<ActivityModel> activities, String selectedType,
      String selectedStatus) {
    emit(const ActivityFilterLoadingState());
    try {
      String? typeFilter;
      if (selectedType == S.current.quizzes) {
        typeFilter = 'quiz';
      } else if (selectedType == S.current.assignments || selectedType == '') {
        typeFilter = 'assignment';
      } else if (selectedType == S.current.all) {
        typeFilter = null;
      }

      List<String> statusFilter;
      if (selectedStatus == S.current.previous) {
        statusFilter = ['finished'];
      } else {
        statusFilter = ['scheduled', 'started'];
      }

      List<ActivityModel> filteredActivities = activities.where((activity) {
        bool typeMatch = activity.type == typeFilter;
        bool statusMatch = statusFilter.contains(activity.status);
        return typeMatch && statusMatch;
      }).toList();

      filteredActivities.sort((a, b) {
        final aDate = DateTime.parse(a.date);
        final bDate = DateTime.parse(b.date);
        return aDate.compareTo(bDate);
      });

      emit(ActivityFilterSuccessState(activities: filteredActivities));
    } catch (e) {
      emit(ActivityFilterErrorState(e.toString()));
    }
  }

  void mergeActivities(GetStudentsQuizzesState quizState,
      GetStudentsAssignmentsState assignmentState) {
    List<ActivityModel> activities = [];

    if (quizState is GetStudentsQuizzesSuccess &&
        assignmentState is GetStudentsAssignmentsSuccess) {
      activities = [...quizState.data, ...assignmentState.data];
      emit(ActivityFilterState.mergeSuccess(activities: activities));
    } else if (quizState is GetStudentsQuizzesFailure ||
        assignmentState is GetStudentsAssignmentsFailure) {
      emit(const ActivityFilterErrorState('Failed to load activities'));
    } else {
      emit(const ActivityFilterLoadingState());
    }
  }
}
