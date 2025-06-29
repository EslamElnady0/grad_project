part of 'add_answer_cubit.dart';

abstract class AddAnswerState {}

class AddAnswerInitial extends AddAnswerState {}

class AddAnswerLoading extends AddAnswerState {}

class AddAnswerSuccess extends AddAnswerState {
  final dynamic data;
  AddAnswerSuccess(this.data);
}

class AddAnswerFailure extends AddAnswerState {
  final String error;
  AddAnswerFailure({required this.error});
}
