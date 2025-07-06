import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/custom_drop_down_button.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_search_text_field.dart';
import 'package:grad_project/core/widgets/failure_state_widget.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/features/time_schedule/logic/activity_filter_cubit/activity_filter_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/activity_filter_cubit/activity_filter_state.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_state.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_state.dart';
import 'package:grad_project/features/time_schedule/presentation/widgets/custom_student_assignment_widget.dart';
import 'package:grad_project/features/time_schedule/presentation/widgets/custom_student_quiz_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TimeScheduleViewBody extends StatefulWidget {
  const TimeScheduleViewBody({super.key});

  @override
  State<TimeScheduleViewBody> createState() => _TimeScheduleViewBodyState();
}

class _TimeScheduleViewBodyState extends State<TimeScheduleViewBody> {
  final TextEditingController searchController = TextEditingController();

  String _currentType = '';
  String _currentStatus = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _currentStatus = S.of(context).scheduled;
      _currentType = S.of(context).all;
      setState(() {});
      _onRefresh();
    });
  }

  Future<void> _onRefresh() async {
    final quizCubit = context.read<GetStudentsQuizzesCubit>();
    final assignmentCubit = context.read<GetStudentsAssignmentsCubit>();
    final filterCubit = context.read<ActivityFilterCubit>();

    try {
      await Future.wait([
        quizCubit.getStudentsQuizzes(),
        assignmentCubit.getStudentsAssignments(),
      ]);

      final quizState = quizCubit.state;
      final assignmentState = assignmentCubit.state;

      if (quizState is GetStudentsQuizzesFailure ||
          assignmentState is GetStudentsAssignmentsFailure) {
        String errorMessage = quizState is GetStudentsQuizzesFailure
            ? quizState.error
            : (assignmentState as GetStudentsAssignmentsFailure).error;
        filterCubit.emit(ActivityFilterErrorState(errorMessage));
        return;
      }

      if (quizState is GetStudentsQuizzesSuccess &&
          assignmentState is GetStudentsAssignmentsSuccess) {
        final activities =
            filterCubit.mergeAndSortActivities(quizState, assignmentState);
        filterCubit.filterActivities(activities, _currentType, _currentStatus);
      }

      searchController.clear();
    } catch (e) {}
  }

  Future<void> _handleFilterChange(String? newType, String? newStatus) async {
    setState(() {
      if (newType != null) {
        _currentType = newType;
      }
      if (newStatus != null) {
        _currentStatus = newStatus;
      }
    });

    final quizCubit = context.read<GetStudentsQuizzesCubit>();
    final assignmentCubit = context.read<GetStudentsAssignmentsCubit>();
    final filterCubit = context.read<ActivityFilterCubit>();

    try {
      await Future.wait([
        quizCubit.getStudentsQuizzes(),
        assignmentCubit.getStudentsAssignments(),
      ]);

      final quizState = quizCubit.state;
      final assignmentState = assignmentCubit.state;

      if (quizState is GetStudentsQuizzesFailure ||
          assignmentState is GetStudentsAssignmentsFailure) {
        String errorMessage = quizState is GetStudentsQuizzesFailure
            ? quizState.error
            : (assignmentState as GetStudentsAssignmentsFailure).error;
        filterCubit.emit(ActivityFilterErrorState(errorMessage));
        return;
      }

      if (quizState is GetStudentsQuizzesSuccess &&
          assignmentState is GetStudentsAssignmentsSuccess) {
        final activities =
            filterCubit.mergeAndSortActivities(quizState, assignmentState);
        filterCubit.filterActivities(activities, _currentType, _currentStatus);
      }

      searchController.clear();
    } catch (e) {
      filterCubit.emit(ActivityFilterErrorState(e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentStatus.isEmpty) {
      _currentStatus = S.of(context).scheduled;
    }
    if (_currentType.isEmpty) {
      _currentType = S.of(context).all;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      child: Column(
        children: [
          CustomInnerScreensAppBar(title: S.of(context).timeSchedule),
          TitleTextWidget(
            text: S.of(context).time_schedule_welcome_message,
          ),
          vGap(15),
          CustomSearchTextField(
            hintText: S.of(context).search_for_task,
            controller: searchController,
            onChanged: (value) {
              context
                  .read<ActivityFilterCubit>()
                  .searchActivitiesByTitle(value);
            },
          ),
          vGap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomDropDownButton(
                value: _currentStatus,
                values: [S.of(context).scheduled, S.of(context).previous],
                onChanged: (value) {
                  _handleFilterChange(null, value);
                },
              ),
              CustomDropDownButton(
                value: _currentType,
                values: [
                  S.of(context).quizzes,
                  S.of(context).assignments,
                  S.of(context).all
                ],
                onChanged: (value) {
                  _handleFilterChange(value, null);
                },
              ),
            ],
          ),
          vGap(15),
          Expanded(
            child:
                BlocConsumer<GetStudentsQuizzesCubit, GetStudentsQuizzesState>(
              listener: (context, quizState) {
                _handleDataChange();
              },
              builder: (context, quizState) {
                return BlocConsumer<GetStudentsAssignmentsCubit,
                    GetStudentsAssignmentsState>(
                  listener: (context, assignmentState) {
                    _handleDataChange();
                  },
                  builder: (context, assignmentState) {
                    return BlocBuilder<ActivityFilterCubit,
                        ActivityFilterState>(
                      builder: (context, filterState) {
                        if (quizState is GetStudentsQuizzesLoading ||
                            assignmentState is GetStudentsAssignmentsLoading) {
                          return _buildLoadingState();
                        }

                        return filterState.maybeWhen(
                          orElse: () => _buildLoadingState(),
                          success: (data) {
                            return _buildSuccessState(data, _onRefresh);
                          },
                          error: (error) {
                            return _buildFailureState(
                                context, error, _onRefresh);
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleDataChange() {
    final quizState = context.read<GetStudentsQuizzesCubit>().state;
    final assignmentState = context.read<GetStudentsAssignmentsCubit>().state;
    final filterCubit = context.read<ActivityFilterCubit>();

    if ((quizState is GetStudentsQuizzesSuccess ||
            quizState is GetStudentsQuizzesFailure) &&
        (assignmentState is GetStudentsAssignmentsSuccess ||
            assignmentState is GetStudentsAssignmentsFailure)) {
      if (quizState is GetStudentsQuizzesFailure ||
          assignmentState is GetStudentsAssignmentsFailure) {
        return;
      }
      if (quizState is GetStudentsQuizzesSuccess &&
          assignmentState is GetStudentsAssignmentsSuccess) {
        filterCubit.initializeFilters(
          quizState,
          assignmentState,
          _currentType,
          _currentStatus,
        );
      }
    }
  }

  Widget _buildSuccessState(
      List<ActivityModel> data, Future<void> Function() onRefresh) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryColorlight,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 10.h),
        itemBuilder: (context, index) {
          return data[index] is StudentQuizModel
              ? CustomStudentQuizWidget(
                  quizModel: data[index] as StudentQuizModel)
              : CustomStudentAssignmentWidget(
                  assignmentModel: data[index] as StudentAssignmentModel);
        },
        separatorBuilder: (context, index) => vGap(12),
        itemCount: data.length,
      ),
    );
  }

  Widget _buildLoadingState() {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 10.h),
        itemBuilder: (context, index) {
          return const CustomStudentQuizWidgetSkeleton();
        },
        separatorBuilder: (context, index) => vGap(12),
        itemCount: 5,
      ),
    );
  }

  Widget _buildFailureState(
      BuildContext context, String error, Future<void> Function() onRefresh) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryColorlight,
      child: FailureStateWidget(
        errorMessage: error,
        title: S.of(context).failedToLoadTasks,
        icon: Icons.task_alt_outlined,
        onRetry: onRefresh,
      ),
    );
  }
}
