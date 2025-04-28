part of '../../widgets/question_list_widget.dart';

class QuestionListCubit extends Cubit<List<int>> {
  QuestionListCubit() : super([0]);

  void addQuestion(
      {required BuildContext context,
      required int selectedQuestionsCount,
      required ScrollController scrollController}) {
    if (state.length >= selectedQuestionsCount) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          S.of(context).maximumNumberOfQuestions,
          style: AppTextStyles.font12WhiteMedium,
        )),
      );
      return;
    }
    final updatedList = List<int>.from(state)..add(state.length);
    emit(updatedList);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        debugPrint('ScrollController has no clients');
      }
    });
  }
}
