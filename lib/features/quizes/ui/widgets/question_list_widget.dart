import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/quizes/ui/models/question_data.dart';
import '../../../../generated/l10n.dart';
import 'question_container.dart';
part '../cubit/question_list_cubit/question_list_cubit.dart';

class QuestionListWidget extends StatelessWidget {
  const QuestionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionListCubit, List<QuestionData>>(
      builder: (context, questionDataList) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: QuestionContainer(index: index),
              );
            },
            childCount: questionDataList.length,
          ),
        );
      },
    );
  }
}
