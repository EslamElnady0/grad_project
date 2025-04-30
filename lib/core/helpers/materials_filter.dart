import 'package:grad_project/core/data/models/get_course_materials_response_model.dart';
import 'package:grad_project/features/subjects/ui/manager/materials_filter_cubit.dart';

class MaterialsFilter {
  static List<CourseMaterialData> filterWeek(
    List<CourseMaterialData> week,
    Set<FilterType> filters,
  ) {
    if (filters.contains(FilterType.all)) {
      return week;
    }

    return week.where((item) => _matchesFilter(item, filters)).toList();
  }

  static bool _matchesFilter(CourseMaterialData item, Set<FilterType> filters) {
    final fileName = item.type?.toLowerCase() ?? '';
    return ((filters.contains(FilterType.lectures) && fileName.contains('lecture')) ||
        (filters.contains(FilterType.sections) && fileName.contains('section')) ||
        (filters.contains(FilterType.other) &&
            !fileName.contains('lecture') &&
            !fileName.contains('section')));
  }
}