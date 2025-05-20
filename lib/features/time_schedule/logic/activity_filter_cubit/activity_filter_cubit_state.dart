


import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';

class ActivityFilterCubitState {}
class ActivityFilterInitialState extends ActivityFilterCubitState {}
class ActivityFilterLoadingState extends ActivityFilterCubitState {}
class ActivityFilterSuccessState extends ActivityFilterCubitState {
  final List<ActivityModel> filteredActivities;
  ActivityFilterSuccessState(this.filteredActivities);
}
class ActivityFilterErrorState extends ActivityFilterCubitState {
  final String error;
  ActivityFilterErrorState(this.error);
}