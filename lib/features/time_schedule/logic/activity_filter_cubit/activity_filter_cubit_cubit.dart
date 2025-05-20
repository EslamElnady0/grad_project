import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/features/time_schedule/logic/activity_filter_cubit/activity_filter_cubit_state.dart';

class ActivityFilterCubitCubit extends Cubit<ActivityFilterCubitState> {
  ActivityFilterCubitCubit() : super(ActivityFilterInitialState());

  void filterActivities(List<ActivityModel> activities, String selectedType,
      String selectedStatus) {
    emit(ActivityFilterLoadingState());
    try {
      List<ActivityModel> filteredActivities = activities.where((activity) {
        bool typeMatch = activity.type == selectedType;
        bool statusMatch = activity.status == selectedStatus;
        return typeMatch && statusMatch;
      }).toList();

      emit(ActivityFilterSuccessState(filteredActivities));
    } catch (e) {
      emit(ActivityFilterErrorState(e.toString()));
    }
  }
}
