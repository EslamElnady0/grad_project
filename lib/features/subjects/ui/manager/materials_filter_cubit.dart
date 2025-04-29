import 'package:flutter_bloc/flutter_bloc.dart';

enum FilterType { all, lectures, sections, quiz, assignment }
class MaterialsFilterCubit extends Cubit<Set<FilterType>> {
  final Set<String> _expandedTiles = {};

  MaterialsFilterCubit() : super({FilterType.all});

  // Toggle a filter
void toggleFilter(FilterType filter) {
  if (filter == FilterType.all) {
    // If "All" is toggled, reset all other filters
    emit({FilterType.all});
  } else {
    // If a specific filter is toggled, clear "All" and toggle the specific filter
    if (state.contains(filter)) {
      emit(Set.from(state)..remove(filter));
    } else {
      emit(Set.from(state)..add(filter)..remove(FilterType.all));
    }
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
