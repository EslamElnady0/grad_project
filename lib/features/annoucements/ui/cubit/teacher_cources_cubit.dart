import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_cources_state.dart';
part 'teacher_cources_cubit.freezed.dart';

class TeacherCourcesCubit extends Cubit<TeacherCourcesState> {
  TeacherCourcesCubit() : super(const TeacherCourcesState.initial());
}
