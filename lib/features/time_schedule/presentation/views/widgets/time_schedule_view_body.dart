import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_search_text_field.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_state.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_state.dart';
import 'package:grad_project/features/time_schedule/presentation/views/widgets/custom_student_assignment_widget.dart';
import 'package:grad_project/features/time_schedule/presentation/views/widgets/custom_student_quiz_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class TimeScheduleViewBody extends StatefulWidget {
  const TimeScheduleViewBody({super.key});

  @override
  State<TimeScheduleViewBody> createState() => _TimeScheduleViewBodyState();
}

class _TimeScheduleViewBodyState extends State<TimeScheduleViewBody> {
  List<ActivityModel> activities = [];

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
          final aDate = DateTime.parse(a.date );
          final bDate = DateTime.parse(b.date );
          return aDate.compareTo(bDate);
        });
      });
    }
    return activities;
  }

  final List<bool> isQuiz = const [true, false, true, true, true, false];

  @override
  Widget build(BuildContext context) {
    final quizState = context.watch<GetStudentsQuizzesCubit>().state;
    final assignmentState = context.watch<GetStudentsAssignmentsCubit>().state;

    List<ActivityModel> activities =
        _mergeAndSortActivities(quizState, assignmentState);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInnerScreensAppBar(title: S.of(context).timeSchedule),
            TitleTextWidget(
              text: S.of(context).time_schedule_welcome_message,
            ),
            vGap(15),
            CustomSearchTextField(
              hintText: S.of(context).search_for_task,
              controller: TextEditingController(),
            ),
            vGap(15),
            /*Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDownButton(
                    initialValue: S.of(context).next_seven_days,
                    values: [S.of(context).next_seven_days],
                  ),
                  CustomDropDownButton(
                    initialValue: S.of(context).assignments,
                    values: [S.of(context).quizzes, S.of(context).assignments],
                  ),
                ],
              ),
            ),*/
            vGap(15),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (activities[index] is StudentQuizModel) {
                  return CustomStudentQuizWidget(quizModel: activities[index]as StudentQuizModel);
                } else {
                  return CustomStudentAssignmentWidget(
                      assignmentModel: activities[index]as StudentAssignmentModel);
                }
              },
              separatorBuilder: (context, index) {
                return vGap(15);
              },
              itemCount: activities.length,
            )
          ],
        ),
      ),
    );
  }
}
