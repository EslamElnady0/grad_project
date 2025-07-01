part of 'add_question_cubit.dart';

abstract class AddQuestionState {}

class AddQuestionInitial extends AddQuestionState {}

class AddQuestionLoading extends AddQuestionState {}

class AddQuestionSuccess extends AddQuestionState {
  final dynamic data;
  AddQuestionSuccess(this.data);
}

class AddQuestionFailure extends AddQuestionState {
  final String error;
  AddQuestionFailure({required this.error});
}
