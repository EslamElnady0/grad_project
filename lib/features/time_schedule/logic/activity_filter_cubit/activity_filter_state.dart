

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
part 'activity_filter_state.freezed.dart';
@freezed
class ActivityFilterState<T> with _$ActivityFilterState {


  const factory ActivityFilterState.initial() = ActivityFilterInitialState<T>;
  const factory ActivityFilterState.loading() = ActivityFilterLoadingState<T>;
  const factory ActivityFilterState.success({
    required List<ActivityModel> activities,
  }) = ActivityFilterSuccessState<T>;
  const factory ActivityFilterState.error(String error) =
      ActivityFilterErrorState<T>;

  const factory ActivityFilterState.mergeSuccess({
    required List<ActivityModel> activities,
  }) = ActivityFilterMergeSuccessState<T>;

}
