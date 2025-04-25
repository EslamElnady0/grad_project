import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementFilterCubit extends Cubit<Set<String>> {
  AnnouncementFilterCubit() : super({});

  void toggleFilter(String subjectName) {
    final currentFilters = Set<String>.from(state);
    if (currentFilters.contains(subjectName)) {
      currentFilters.remove(subjectName);
    } else {
      currentFilters.add(subjectName);
    }
    emit(currentFilters);
  }

  void clearFilters() {
    emit({});
  }
}
