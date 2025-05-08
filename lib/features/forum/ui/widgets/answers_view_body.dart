import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/forum/ui/widgets/custom_answer_chat.dart';
import 'package:grad_project/features/forum/ui/widgets/custom_answer_item.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/title_text_widget.dart';

class AnswersViewBody extends StatelessWidget {
  const AnswersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                CustomAppBar(title: S.of(context).answer),
                vGap(8),
                TitleTextWidget(text: S.of(context).Answers_welcome_message),
                vGap(18),
              ],
            ),
          ),
          const CustomAnswerItem(),
          vGap(18),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: const CustomAnsewrChat(),
            ),
          ),
        ],
      ),
    );
  }
}
