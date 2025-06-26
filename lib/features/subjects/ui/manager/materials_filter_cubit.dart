import 'package:flutter_bloc/flutter_bloc.dart';

enum FilterType { all, lectures, sections,other }
class MaterialsFilterCubit extends Cubit<Set<FilterType>> {
  final Set<String> _expandedTiles = {};

  MaterialsFilterCubit() : super({FilterType.all});

  // Toggle a filter
  void toggleFilter(FilterType filter) {
    if (filter == FilterType.all) {
      // إذا تم اختيار "All"، قم بإعادة تعيين جميع الفلاتر الأخرى
      emit({FilterType.all});
    } else {
      // إذا تم اختيار فلتر معين، قم بإزالة "All" وتبديل الفلتر المحدد
      final updatedFilters = Set<FilterType>.from(state);
      if (updatedFilters.contains(filter)) {
        updatedFilters.remove(filter);
      } else {
        updatedFilters.add(filter);
      }
      updatedFilters.remove(FilterType.all);

      // إذا كانت مجموعة الفلاتر فارغة، قم بإضافة "All"
      if (updatedFilters.isEmpty) {
        updatedFilters.add(FilterType.all);
      }

      emit(updatedFilters);
    }
  }

  // Clear all filters except "All"
  void selectAll() {
    emit({FilterType.all});
  }

  // Reset to default state
  void resetFilters() {
    emit({FilterType.all});
    _expandedTiles.clear();
  }

  // Expand or collapse a tile
  void toggleExpandedTile(String day) {
    if (_expandedTiles.contains(day)) {
      _expandedTiles.remove(day);
    } else {
      _expandedTiles.add(day);
    }
    emit(state); // Trigger rebuild
  }

  // Check if a tile is expanded
  bool isTileExpanded(String day) {
    return _expandedTiles.contains(day);
  }

  // Get the current set of filters
  Set<FilterType> get filters => state;
}
