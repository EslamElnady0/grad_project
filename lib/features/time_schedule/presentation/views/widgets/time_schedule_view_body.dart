import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/custom_drop_down_button.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_search_text_field.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/features/time_schedule/logic/activity_filter_cubit/activity_filter_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/activity_filter_cubit/activity_filter_state.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_state.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_state.dart';
import 'package:grad_project/features/time_schedule/presentation/views/widgets/custom_student_assignment_widget.dart';
import 'package:grad_project/features/time_schedule/presentation/views/widgets/custom_student_quiz_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TimeScheduleViewBody extends StatefulWidget {
  const TimeScheduleViewBody({super.key});

  @override
  State<TimeScheduleViewBody> createState() => _TimeScheduleViewBodyState();
}

class _TimeScheduleViewBodyState extends State<TimeScheduleViewBody> {
  List<ActivityModel> activities = [];

  String selectedType = '';
  String selectedStatus = '';

  bool _isFirstLoad = true;
  final TextEditingController searchController = TextEditingController();

  List<ActivityModel> _mergeAndSortActivities(GetStudentsQuizzesState quizState,
      GetStudentsAssignmentsState assignmentState) {
    if (quizState is GetStudentsQuizzesSuccess &&
        assignmentState is GetStudentsAssignmentsSuccess) {
      final quizzes = quizState.data;
      final assignments = assignmentState.data;

      final combined = <ActivityModel>[
        ...quizzes,
        ...assignments,
      ];
      setState(() {
        activities = combined;
        activities.sort((a, b) {
          final aDate = DateTime.parse(a.date);
          final bDate = DateTime.parse(b.date);
          return aDate.compareTo(bDate);
        });
      });
    }
    return activities;
  }

  Future<void> _onRefresh() async {
    final quizCubit = context.read<GetStudentsQuizzesCubit>();
    final assignmentCubit = context.read<GetStudentsAssignmentsCubit>();
    final filterCubit = context.read<ActivityFilterCubit>();

    await Future.wait([
      quizCubit.getStudentsQuizzes(),
      assignmentCubit.getStudentsAssignments(),
    ]);

    final quizState = quizCubit.state;
    final assignmentState = assignmentCubit.state;

    final refreshedActivities =
        _mergeAndSortActivities(quizState, assignmentState);

    filterCubit.filterActivities(
        refreshedActivities, selectedType, selectedStatus);

    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    if (selectedStatus.isEmpty) {
      selectedStatus = S.of(context).scheduled;
    }
    if (selectedType.isEmpty) {
      selectedType = S.of(context).all;
    }

    final quizState = context.watch<GetStudentsQuizzesCubit>().state;
    final assignmentState = context.watch<GetStudentsAssignmentsCubit>().state;

    List<ActivityModel> activities =
        _mergeAndSortActivities(quizState, assignmentState);

    if (_isFirstLoad &&
        quizState is GetStudentsQuizzesSuccess &&
        assignmentState is GetStudentsAssignmentsSuccess) {
      _isFirstLoad = false;
      final filterCubit = context.read<ActivityFilterCubit>();
      filterCubit.setFullActivityList(activities); // 💡 Important
      filterCubit.filterActivities(activities, selectedType, selectedStatus);
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
                value: selectedStatus,
                values: [S.of(context).scheduled, S.of(context).previous],
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      selectedStatus = value;
                    }
                    context.read<ActivityFilterCubit>().filterActivities(
                        activities, selectedType, selectedStatus);
                  });
                  searchController.clear();
                },
              ),
              CustomDropDownButton(
                  value: selectedType,
                  values: [
                    S.of(context).quizzes,
                    S.of(context).assignments,
                    S.of(context).all
                  ],
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        selectedType = value;
                      }
                      context.read<ActivityFilterCubit>().filterActivities(
                          activities, selectedType, selectedStatus);
                    });
                    searchController.clear();
                  }),
            ],
          ),
          vGap(15),

          Expanded(
            child: BlocBuilder<ActivityFilterCubit, ActivityFilterState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => _buildLoadingState(),
                  success: (data) {
                    return _buildSuccessState(
                      data,
                      _onRefresh,
                    );
                  },
                );
              },
            ),
          ),
          // quizState.maybeWhen(
          //   orElse: () => _buildLoadingState(),
          //   getStudentsQuizzesSuccess: (data) {
          //     return assignmentState.maybeWhen(
          //       orElse: () => _buildLoadingState(),
          //       getStudentsAssignmentsSuccess: (data) {
          //         return _buildSuccessState(activities);
          //       },
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}

Widget _buildSuccessState(
    List<ActivityModel> data, Future<void> Function() onRefresh) {
  return RefreshIndicator(
    onRefresh: onRefresh,
    color: AppColors.primaryColorlight,
    child: ListView.separated(
      shrinkWrap: true,
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
