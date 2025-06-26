import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/quizes/ui/models/question_data.dart';
import '../../data/models/get_quiz_using_id_response.dart';
import 'question_container.dart';
part '../../ui/cubit/question_list_cubit/question_list_cubit.dart';

class QuestionListWidget extends StatelessWidget {
  const QuestionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionListCubit, List<QuestionData>>(
      builder: (context, questionDataList) {
        if (questionDataList.isEmpty) {
          return const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index >= questionDataList.length) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: QuestionContainer(
                  index: index,
                  questionData: questionDataList[index],
                ),
              );
            },
            childCount: questionDataList.length,
          ),
        );
      },
    );
  }
}
