import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/forum/data/models/question_and_answers_response_model.dart';
import 'package:grad_project/features/forum/ui/widgets/custom_like_toggle_answer.dart';
import 'package:grad_project/features/forum/ui/widgets/show_qusetion_image.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:grad_project/features/forum/logic/delete_content_service.dart';
import 'package:grad_project/features/forum/logic/question_and_answers/question_and_answers_cubit.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/doctor_info_section.dart';

class CustomAnswerItem extends StatelessWidget {
  const CustomAnswerItem({
    super.key,
    this.answerModel,
    this.questionId,
  });

  final AnswerModel? answerModel;
  final String? questionId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Row(
        children: [
          Expanded(
            child: Skeleton.leaf(
              enabled: true,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.darkblue),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DoctorInfoSection(
                              name: answerModel?.user?.name ?? "",
                              specialization:
                                  "${answerModel?.user?.department} ${S.of(context).semester} ${answerModel?.user?.semester}",
                            ),
                          ),
                          FutureBuilder<bool>(
                            future: _canShowDeleteButton(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data == true) {
                                return PopupMenuButton<String>(
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: AppColors.gray,
                                    size: 18.sp,
                                  ),
                                  color: AppColors.white,
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  offset: Offset(-8.w, 8.h),
                                  itemBuilder: (BuildContext context) => [
                                    PopupMenuItem<String>(
                                      value: 'delete',
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.delete_outline,
                                            color: AppColors.redDark,
                                            size: 16.sp,
                                          ),
                                          hGap(8),
                                          Text(
                                            S.of(context).delete,
                                            style: AppTextStyles.font12BlackMedium.copyWith(
                                              color: AppColors.redDark,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  onSelected: (String value) {
                                    if (value == 'delete') {
                                      _handleDeleteAnswer(context);
                                    }
                                  },
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                      vGap(8),
                      if (answerModel != null &&
                          answerModel!.imageUrl != null &&
                          answerModel!.imageUrl!.isNotEmpty)
                        ShowQusetionImage(
                          height: 150.h,
                          imageUrl: answerModel!.imageUrl!,
                        ),
                      vGap(8),
                      Text(
                        answerModel?.body ?? "",
                        style: AppTextStyles.font12GrayMedium.copyWith(
                          color: AppColors.darkblue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          hGap(8),
          CustomLikeToggleAnswer(
            questionId: answerModel?.id ?? "",
            likesCount: answerModel?.likes ?? 0,
            value: answerModel?.user?.liked ?? false,
          ),
        ],
      ),
    );
  }

  Future<bool> _canShowDeleteButton() async {
    if (answerModel?.user?.id == null) return false;
    return await getIt<DeleteContentService>().canDeleteContent(answerModel!.user!.id!.toString());
  }

  void _handleDeleteAnswer(BuildContext context) {
    if (answerModel?.id != null && answerModel?.user?.id != null) {
      getIt<DeleteContentService>().deleteAnswer(
        context: context,
        answerId: answerModel!.id!.toString(),
        ownerId: answerModel!.user!.id!.toString(),
        onSuccess: () {
          // Refresh the question and answers after successful deletion
          if (questionId != null) {
            try {
              context.read<QuestionAndAnswersCubit>().getQuestionAndAnswers(questionId!);
            } catch (e) {
              // If cubit is not available in the context, ignore the error
              // This can happen if the widget is used in different contexts
            }
          }
        },
      );
    }
  }
}
