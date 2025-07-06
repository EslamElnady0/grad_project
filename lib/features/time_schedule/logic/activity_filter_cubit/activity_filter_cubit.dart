import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/features/time_schedule/logic/activity_filter_cubit/activity_filter_state.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_state.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_state.dart';
import 'package:grad_project/generated/l10n.dart';

class ActivityFilterCubit extends Cubit<ActivityFilterState> {
  ActivityFilterCubit() : super(const ActivityFilterInitialState());

  List<ActivityModel> _fullActivityList = [];
  String _selectedType = '';
  String _selectedStatus = '';

  void setFullActivityList(List<ActivityModel> activities) {
    _fullActivityList = activities;
  }

  void filterActivities(List<ActivityModel> activities, String selectedType,
      String selectedStatus) async {
    _selectedType = selectedType;
    _selectedStatus = selectedStatus;
    emit(const ActivityFilterLoadingState());

    try {
      String? typeFilter;
      if (selectedType == S.current.quizzes) {
        typeFilter = 'quiz';
      } else if (selectedType == S.current.assignments) {
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
        bool typeMatch = activity.type == typeFilter || typeFilter == null;
        bool statusMatch = statusFilter.contains(activity.status);
        return typeMatch && statusMatch;
      }).toList();

      filteredActivities.sort((a, b) {
        final aDate = DateTime.parse(a.date);
        final bDate = DateTime.parse(b.date);
        return aDate.compareTo(bDate);
      });

      await Future.delayed(const Duration(milliseconds: 300));
      emit(ActivityFilterSuccessState(activities: filteredActivities));
    } catch (e) {
      emit(ActivityFilterErrorState(e.toString()));
    }
  }

  List<ActivityModel> mergeAndSortActivities(GetStudentsQuizzesState quizState,
      GetStudentsAssignmentsState assignmentState) {
    if (quizState is GetStudentsQuizzesFailure) {
      emit(ActivityFilterErrorState(quizState.error));
      return [];
    }

    if (assignmentState is GetStudentsAssignmentsFailure) {
      emit(ActivityFilterErrorState(assignmentState.error));
      return [];
    }

    if (quizState is GetStudentsQuizzesSuccess &&
        assignmentState is GetStudentsAssignmentsSuccess) {
      final quizzes = quizState.data;
      final assignments = assignmentState.data;

      final combined = <ActivityModel>[
        ...quizzes,
        ...assignments,
      ];

      combined.sort((a, b) {
        final aDate = DateTime.parse(a.date);
        final bDate = DateTime.parse(b.date);
        return aDate.compareTo(bDate);
      });

      _fullActivityList = combined;
      return combined;
    }

    return [];
  }

  void handleFilterChange(
      GetStudentsQuizzesState quizState,
      GetStudentsAssignmentsState assignmentState,
      String? newType,
      String? newStatus) {
    if (newType != null) {
      _selectedType = newType;
    }
    if (newStatus != null) {
      _selectedStatus = newStatus;
    }

    if (quizState is GetStudentsQuizzesFailure) {
      emit(ActivityFilterErrorState(quizState.error));
      return;
    }

    if (assignmentState is GetStudentsAssignmentsFailure) {
      emit(ActivityFilterErrorState(assignmentState.error));
      return;
    }

    final updatedActivities =
        mergeAndSortActivities(quizState, assignmentState);
    filterActivities(updatedActivities, _selectedType, _selectedStatus);
  }

  void initializeFilters(
      GetStudentsQuizzesState quizState,
      GetStudentsAssignmentsState assignmentState,
      String defaultType,
      String defaultStatus) {
    if (_selectedType.isEmpty) _selectedType = defaultType;
    if (_selectedStatus.isEmpty) _selectedStatus = defaultStatus;

    if (quizState is GetStudentsQuizzesFailure) {
      emit(ActivityFilterErrorState(quizState.error));
      return;
    }

    if (assignmentState is GetStudentsAssignmentsFailure) {
      emit(ActivityFilterErrorState(assignmentState.error));
      return;
    }

    if (quizState is GetStudentsQuizzesSuccess &&
        assignmentState is GetStudentsAssignmentsSuccess) {
      final activities = mergeAndSortActivities(quizState, assignmentState);
      setFullActivityList(activities);
      filterActivities(activities, _selectedType, _selectedStatus);
    }
  }

  void searchActivitiesByTitle(String query) {
    if (query.trim().isEmpty) {
      filterActivities(_fullActivityList, _selectedType, _selectedStatus);
      return;
    }

    final filtered = _fullActivityList.where((activity) {
      return activity.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(ActivityFilterSuccessState(activities: filtered));
  }

  String get selectedType => _selectedType;
  String get selectedStatus => _selectedStatus;
}
