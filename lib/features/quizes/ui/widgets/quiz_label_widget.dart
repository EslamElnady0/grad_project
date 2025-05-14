import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/get_quizzes_response.dart';
import 'quiz_label_widget_content.dart';

class QuizLabelWidget extends StatelessWidget {
  const QuizLabelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final quizModel = context.read<QuizModel>();
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: QuizLabelWidgetContent(
        title: quizModel.title,
        trailing: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Colors.black,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            quizModel.status == 'finished'
                ? S.of(context).done
                : S.of(context).scheduled,
            style: AppTextStyles.font10BlackMedium,
          ),
        ),
      ),
    );
  }
}
