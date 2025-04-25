import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_annoucement_request_body.dart';
import '../../data/repos/annoucements_repo.dart';
part 'add_annoucements_state.dart';
part 'add_annoucements_cubit.freezed.dart';

class AddAnnoucementsCubit extends Cubit<AddAnnoucementsState> {
  final AnnoucementsRepo _repo;
  AddAnnoucementsCubit(this._repo)
      : super(const AddAnnoucementsState.initial());
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String selectedLevel = 'الفرقة الأولى';
  String selectedCourse = 'Data Structures';
  String? selectedDate;
  String? selectedTime;
  Future<void> addAnnoucement() async {
    emit(const AddAnnoucementsState.addAnnoucementsLoading());
    final result = await _repo.addAnnoucement(
      AnnouncementRequestBody(
        departmentId: "2",
        semesterId: '3',
        courseId: "3",
        title: titleController.text,
        body: descController.text,
        date: selectedDate,
        time: selectedTime,
      ),
    );
    result.when(
      success: (data) {
        emit(AddAnnoucementsState.addAnnoucementsSuccess(data));
      },
      failure: (error) {
        emit(AddAnnoucementsState.addAnnoucementsFailure(
            error.getAllMessages()));
      },
    );
  }

  List<String> levels = [
    'الفرقة الأولى',
    'الفرقة الثانية',
    'الفرقة الثالثة',
    'الفرقة الرابعة',
  ];
  List<String> courses = [
    'Data Structures',
    'Database',
    'Computer Networks',
    'Operating Systems',
  ];
  @override
  Future<void> close() {
    titleController.dispose();
    descController.dispose();
    return super.close();
  }
}
