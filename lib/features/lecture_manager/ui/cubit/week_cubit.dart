import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;


class WeekCubit extends Cubit<WeekState> {
  WeekCubit()
      : super(
          WeekState(
            weakAr: {
              "week1": "الأسبوع الأول",
              "week2": "الأسبوع الثاني",
              "week3": "الأسبوع الثالث",
              "week4": "الأسبوع الرابع",
              "week5": "الأسبوع الخامس",
              "week6": "الأسبوع السادس",
              "week7": "الأسبوع السابع",
              "week8": "الأسبوع الثامن",
              "week9": "الأسبوع التاسع",
              "week10": "الأسبوع العاشر",
              "week11": "الأسبوع الحادي عشر",
              "week12": "الأسبوع الثاني عشر",
              "week13": "الأسبوع الثالث عشر",
              "week14": "الأسبوع الرابع عشر",
            },
            weakEn: {
              "week1": "Week One",
              "week2": "Week Two",
              "week3": "Week Three",
              "week4": "Week Four",
              "week5": "Week Five",
              "week6": "Week Six",
              "week7": "Week Seven",
              "week8": "Week Eight",
              "week9": "Week Nine",
              "week10": "Week Ten",
              "week11": "Week Eleven",
              "week12": "Week Twelve",
              "week13": "Week Thirteen",
              "week14": "Week Fourteen",
            },
            expandedMap: {
              for (int i = 1; i <= 14; i++) "week$i": false,
            },
          ),
        );

  void toggleWeek(String weekKey, bool isExpanded) {
    final updatedExpandedMap = Map<String, bool>.from(state.expandedMap);
    updatedExpandedMap[weekKey] = isExpanded;
    emit(state.copyWith(expandedMap: updatedExpandedMap));
  }
}

class WeekState {
  final Map<String, String> weakAr;
  final Map<String, String> weakEn;
  final Map<String, bool> expandedMap;

  WeekState({
    required this.weakAr,
    required this.weakEn,
    required this.expandedMap,
  });

  WeekState copyWith({
    Map<String, String>? weakAr,
    Map<String, String>? weakEn,
    Map<String, bool>? expandedMap,
  }) {
    return WeekState(
      weakAr: weakAr ?? this.weakAr,
      weakEn: weakEn ?? this.weakEn,
      expandedMap: expandedMap ?? this.expandedMap,
    );
  }
}