import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';
import 'package:grad_project/features/forum/ui/widgets/button_row.dart';
import 'package:grad_project/features/forum/ui/widgets/show_qusetion_image.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:intl/intl.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/item_header.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomForumItem extends StatelessWidget {
  const CustomForumItem({super.key, this.questionModel});
  final QuestionModel? questionModel;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    DateTime? createdAt;
    String from;
    String date;
    if (questionModel != null && questionModel!.createdAt != null) {
      createdAt = DateTime.tryParse(questionModel!.createdAt!);
      if (createdAt != null) {
        from = timeago.format(createdAt, locale: locale);
        date = DateFormat('dd/MM/yyyy', locale).format(createdAt);
      } else {
        from = S.of(context).unknown;
        date = S.of(context).unknown;
      }
    } else {
      from = S.of(context).unknown;
      date = S.of(context).unknown;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5.r,
                    spreadRadius: 3,
                    color: const Color(0xff112316).withOpacity(0.15)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemHeader(
                  from: from,
                  date: date,
                  name: questionModel?.user?.name ?? "",
                  specialization: questionModel?.user?.department ?? "",
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
                  ShowQusetionImage(questionModel: questionModel)
              ],
            ),
          ),
          vGap(8),
          ButtonRow(
            questionModel: questionModel,
          ),
          const Divider(
            endIndent: 80,
            indent: 80,
            color: AppColors.gray,
            thickness: 2,
            height: 16,
          )
        ],
      ),
    );
  }
}
