import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/features/quizes/data/models/get_quizzes_request_query_params_model.dart';
import 'package:grad_project/features/quizes/data/models/get_quizzes_response.dart';
import 'package:grad_project/features/quizes/logic/get_quizzes_cubit/get_quizzes_cubit.dart';
import 'package:grad_project/features/quizes/ui/widgets/custom_quiz_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_drop_down_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class TeacherQuizzesViewBody extends StatelessWidget {
  final GetQuizzesRequestQueryParamsModel queryParamsModel;
  const TeacherQuizzesViewBody({super.key, required this.queryParamsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(22),
        symmetricPaddingWidget(
            child: CustomInnerScreensAppBar(
                title: queryParamsModel.quizStatus == "scheduled"
                    ? S.of(context).scheduled_quizzes
                    : S.of(context).previous_quizzes)),
        vGap(12),
        symmetricPaddingWidget(
            horizontalPadding: 36.w,
            child: TitleTextWidget(
                text: queryParamsModel.quizStatus == "scheduled"
                    ? S.of(context).scheduled_quizzes_description
                    : S.of(context).previous_quizzes_description)),
        vGap(10),
        symmetricPaddingWidget(
            child: Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                fillColor: AppColors.veryLightGray,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    Assets.imagesSvgsMagnifyingGlassIcon,
                    colorFilter:
                        const ColorFilter.mode(AppColors.gray, BlendMode.srcIn),
                  ),
                ),
                hintText: S.of(context).theSearch,
                textInputType: TextInputType.text,
              ),
            ),
            hGap(8),
            CustomDropDownButton(
              initialValue: S.of(context).next_seven_days,
              values: [S.of(context).next_seven_days],
            ),
          ],
        )),
        vGap(12),
        Expanded(
          child: BlocBuilder<GetQuizzesCubit, GetQuizzesState>(
              builder: (context, state) => state.maybeWhen(
                    orElse: () => _buildLoadingState(),
                    getQuizzesSuccess: (data) => _buildSuccessState(data),
                  )),
        )
      ],
    );
  }

  Widget _buildSuccessState(GetQuizzesResponse data) {
    final sortedQuizzes = [...data.data]..sort((a, b) =>
        DateTime.parse('${a.date} ${a.startTime}')
            .compareTo(DateTime.parse('${b.date} ${b.startTime}')));

    return ListView.separated(
      padding: EdgeInsets.only(top: 10.h),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomQuizWidget(
            quizModel: sortedQuizzes[index],
          ),
        );
      },
      separatorBuilder: (context, index) => vGap(12),
      itemCount: sortedQuizzes.length,
      physics: const BouncingScrollPhysics(),
    );
  }
}

Widget _buildLoadingState() {
  return Skeletonizer(
    enabled: true,
    child: ListView.separated(
      padding: EdgeInsets.only(top: 10.h),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const CustomQuizWidgetSkeleton(),
        );
      },
      separatorBuilder: (context, index) => vGap(12),
      itemCount: 5,
    ),
  );
}
