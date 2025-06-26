import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_red_grad_container.dart';
import 'package:grad_project/features/quizes/logic/submit_quiz_cubit/submit_quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/cubit/quiz_cubit/quiz_cubit.dart';
import 'package:grad_project/generated/l10n.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/get_quiz_using_id_response.dart';

class FinishQuizRow extends StatelessWidget {
  const FinishQuizRow({super.key});

  @override
  Widget build(BuildContext context) {
    GetQuizByIdResponse data = context.read<GetQuizByIdResponse>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 40,
          height: 40,
        ),
        hGap(70),
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.read<QuizCubit>().prepareSubmission(data.data.questions);
              final submission = context.read<QuizCubit>().getSubmission();
              context.read<SubmitQuizCubit>().submitQuiz(
                  quizId: data.data.id.toString(),
                  submitQuizRequestModel: submission);
            },
            child: CustomRedGradContainer(
              alignment: Alignment.center,
              raduis: 10,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                S.of(context).submitAndFinish,
                style: AppTextStyles.font13WhiteBold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
