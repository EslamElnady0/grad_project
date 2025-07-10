import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/get_time_info.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/item_header.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';
import 'package:grad_project/features/forum/ui/widgets/show_qusetion_image.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:grad_project/features/forum/logic/delete_content_service.dart';
import 'package:grad_project/features/forum/logic/get_all_questions_cubit/get_all_questions_cubit.dart';
import 'package:grad_project/core/di/dependency_injection.dart';

class CustomQuestionForumItem extends StatelessWidget {
  const CustomQuestionForumItem({
    super.key,
    this.questionModel,
    this.onQuestionDeleted,
  });

  final QuestionModel? questionModel;
  final VoidCallback? onQuestionDeleted;

  @override
  Widget build(BuildContext context) {
      final timeInfo = getTimeInfo(context, questionModel?.createdAt);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: isArabicLocale(context) ? 2.w : 16.w,
        right: isArabicLocale(context) ? 16.w : 2.w,
        top: 12.h, bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5.r,
            spreadRadius: 3,
            color: const Color(0xff112316).withOpacity(0.15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ItemHeader(
                  from: timeInfo.from,
                  date: timeInfo.date,
                  name: questionModel?.user?.name ?? "",
                  specialization: "${questionModel?.user?.department?.name} ${S.of(context).semester} ${questionModel?.user?.semester}",
                ),
              ),
              FutureBuilder<bool>(
                future: _canShowDeleteButton(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data == true) {
                    return PopupMenuButton<String>(

                      padding: EdgeInsets.zero,
                      icon: Icon(
                      
                        Icons.more_vert,
                       
                        color: AppColors.gray,
                        size: 20.sp,
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
                                size: 18.sp,
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
                          _handleDeleteQuestion(context);
                        }
                      },
                    );
                  }
                  return hGap(8);
                },
              ),
            ],
          ),
          vGap(12),
          Text(
            questionModel?.body ?? "",
            style: AppTextStyles.font10greenMedium
                .copyWith(color: AppColors.black),
          ),
          if (questionModel != null &&
              questionModel!.imageUrl != null &&
              questionModel!.imageUrl!.isNotEmpty)
            ShowQusetionImage(imageUrl: questionModel!.imageUrl!)
        ],
      ),
    );
  }

  Future<bool> _canShowDeleteButton() async {
    if (questionModel?.user?.id == null) return false;
    // For now, use a placeholder owner ID - this should be replaced with actual user ID from the API
    return await getIt<DeleteContentService>().canDeleteContent(questionModel!.user!.id!.toString());
  }

  void _handleDeleteQuestion(BuildContext context) {
    if (questionModel?.id != null) {
      getIt<DeleteContentService>().deleteQuestion(
        context: context,
        questionId: questionModel!.id!,
        ownerId: questionModel!.user!.id!.toString(),
        onSuccess: () {
          // Call the deletion callback (e.g., navigate back or refresh)
          onQuestionDeleted?.call();
          
          // Refresh the questions list after successful deletion
          try {
            context.read<GetAllQuestionsCubit>().getAllQuestions();
          } catch (e) {
            // If cubit is not available in the context, ignore the error
            // This can happen if the widget is used in different contexts
          }
        },
      );
    }
  }
}
