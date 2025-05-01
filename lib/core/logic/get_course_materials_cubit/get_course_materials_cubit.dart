import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/get_course_materials_response_model.dart';
import '../../data/repos/get_course_materials_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_course_materials_state.dart';
part 'get_course_materials_cubit.freezed.dart';

class GetCourseMaterialsCubit extends Cubit<GetCourseMaterialsState> {
  final GetCourseMaterialsRepo _repo;
  GetCourseMaterialsCubit(this._repo)
      : super(const GetCourseMaterialsState.initial());

  List<int> weekNumbers = [];
  Map<int, List<CourseMaterialData>> sortedMaterialsByWeek = {};

  Future<void> get({required int courseId}) async {
    emit(const GetCourseMaterialsState.getCourseMaterialsLoading());
    final result = await _repo.getCourseMaterials(courseId: courseId);
    result.when(
      success: (response) {
        emit(GetCourseMaterialsState.getCourseMaterialsSuccess(response));
        _processMaterials(response.data ?? []);
      },
      failure: (error) {
        emit(GetCourseMaterialsState.getCourseMaterialsFailure(
          error.getAllMessages(),
        ));
      },
    );
  }

  void _processMaterials(List<CourseMaterialData> materials) {
    final materialsByWeekNumber = <int, List<CourseMaterialData>>{};

    for (final material in materials) {
      final weekNumber = _extractWeekNumber(material.week);
      if (weekNumber != null) {
        materialsByWeekNumber.putIfAbsent(weekNumber, () => []);
        materialsByWeekNumber[weekNumber]!.add(material);
      }
    }

    sortedMaterialsByWeek = Map.fromEntries(
      materialsByWeekNumber.entries.toList()
        ..sort((a, b) => a.key.compareTo(b.key)),
    );

    weekNumbers = sortedMaterialsByWeek.keys.toList();
  }

  int? _extractWeekNumber(String? weekString) {
    if (weekString == null) return null;
    return int.tryParse(weekString.replaceAll(RegExp(r'[^0-9]'), ''));
  }
}
