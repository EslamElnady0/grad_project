import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/format_date_and_time_helpers.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/quizes/data/models/get_quizzes_request_query_params_model.dart';
import 'package:grad_project/features/quizes/data/models/get_quizzes_response.dart';
import 'package:grad_project/features/quizes/logic/delete_quiz_cubit/delete_quiz_cubit.dart';
import 'package:grad_project/features/quizes/logic/get_quizzes_cubit/get_quizzes_cubit.dart';
import 'package:grad_project/features/quizes/ui/views/quiz_details_view.dart';
import 'package:grad_project/features/quizes/ui/views/update_quiz_view.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../views/quiz_results_view.dart';
import 'activity_pop_up_menu.dart';

class CustomQuizWidget extends StatelessWidget {
  final GetQuizzesRequestQueryParamsModel queryParamsModel;
  final QuizModel quizModel;
  const CustomQuizWidget({
    super.key,
    required this.quizModel,
    required this.queryParamsModel,
  });

  @override
  Widget build(BuildContext context) {
    String startTime = FormatDateAndTimeHelpers.convertTo12HourFormat(
      quizModel.startTime.substring(0, 5),
    ).substring(0, 5);
    String timePeriod = FormatDateAndTimeHelpers.convertTo12HourFormat(
      quizModel.startTime.substring(0, 5),
    ).substring(5, 8);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 16,
              color: AppColors.black.withOpacity(0.16),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                FormatDateAndTimeHelpers.formatDateToDayFullMonthAndYear(
                    quizModel.date, context),
                style: AppTextStyles.font16DarkerBlueBold,
              ),
              const Spacer(),
              ActivityPopUpMenu(
                onEditPressed: () {
                  GoRouter.of(context).push(
                    UpdateQuizView.routeName,
                    extra: quizModel.id.toString(),
                  );
                },
                onDeletePressed: () async {
                  await context.read<DeleteQuizCubit>().deleteQuiz(
                        quizModel.id.toString(),
                      );
                  if (context.mounted) {
                    await context.read<GetQuizzesCubit>().getQuizzes(
                          courseId: queryParamsModel.courseId,
                          quizStatus: queryParamsModel.quizStatus,
                          fromDate: queryParamsModel.fromDate,
                        );
                  }
                },
              ),
            ],
          ),
          vGap(10),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    startTime,
                    style: AppTextStyles.font14DarkBlueMedium,
                  ),
                  Text(
                    timePeriod,
                    style: AppTextStyles.font14DarkBlueMedium,
                  )
                ],
              ),
              hGap(10),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  gradient: Constants.secondaryGrad,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.imagesSvgsQuizIcon,
                    width: 30,
                  ),
                ),
              ),
              hGap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quizModel.title,
                    style: AppTextStyles.font16DarkerBlueBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  vGap(8),
                  Text(
                    quizModel.course.name,
                    style: AppTextStyles.font10GraySemiBold,
                  )
                ],
              ),
            ],
          ),
          vGap(15),
          CustomQuizButton(
            isDone: quizModel.status == "finished",
            quizModel: quizModel,
          )
        ],
      ),
    );
  }
}

class CustomQuizButton extends StatelessWidget {
  final QuizModel? quizModel;
  final bool isDone;

  const CustomQuizButton({
    super.key,
    required this.isDone,
    this.quizModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        !isDone
            ? GoRouter.of(context)
                .push(QuizDetailsView.routeName, extra: quizModel)
            : GoRouter.of(context).push(QuizResultsView.routeName,
                extra: quizModel?.id.toString());
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: isDone ? Constants.secondaryGrad : null,
          color: isDone ? null : AppColors.darkblue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
              isDone ? S.of(context).results : S.of(context).quizDetails,
              style: AppTextStyles.font12WhiteMedium),
        ),
      ),
    );
  }
}

class CustomQuizWidgetSkeleton extends StatelessWidget {
  const CustomQuizWidgetSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 16,
              color: AppColors.black.withOpacity(0.16),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Loading...",
            style: AppTextStyles.font16DarkerBlueBold,
          ),
          vGap(10),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "10:00",
                    style: AppTextStyles.font14DarkBlueMedium,
                  ),
                  Text(
                    "PM",
                    style: AppTextStyles.font14DarkBlueMedium,
                  )
                ],
              ),
              hGap(10),
              Skeleton.leaf(
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: Constants.secondaryGrad,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.imagesSvgsQuizIcon,
                      width: 30,
                    ),
                  ),
                ),
              ),
              hGap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Loading...",
                    style: AppTextStyles.font16DarkerBlueBold,
                  ),
                  vGap(8),
                  Text(
                    "Loading...",
                    style: AppTextStyles.font10GraySemiBold,
                  )
                ],
              ),
            ],
          ),
          vGap(15),
          const Skeleton.leaf(
            child: CustomQuizButton(
              isDone: true,
            ),
          )
        ],
      ),
    );
  }
}
