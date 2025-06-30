import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_and_icon_button.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:grad_project/core/helpers/spacing.dart';

class FilterQuestionsBottomSheet extends StatefulWidget {
  final Function({
    int? department,
    int? semester,
    bool? likes,
    bool? myQuestions,
  })? onFiltersApplied;

  const FilterQuestionsBottomSheet({
    super.key,
    this.onFiltersApplied,
  });

  @override
  State<FilterQuestionsBottomSheet> createState() => _FilterQuestionsBottomSheetState();
}

class _FilterQuestionsBottomSheetState extends State<FilterQuestionsBottomSheet> {
  int? selectedDepartment;
  int? selectedSemester;
  bool likedQuestions = false;
  bool myQuestions = false;

  final Map<int, String> departments = {
    1: 'computer_science',
    2: 'information_systems',
    3: 'artificial_intelligence',
    4: 'data_science',
    5: 'information_technology',
  };

  final Map<int, String> semesters = {
    1: 'prep_first',
    2: 'prep_second',
    3: 'first_first',
    4: 'first_second',
    5: 'second_first',
    6: 'second_second',
    7: 'third_first',
    8: 'third_second',
    9: 'fourth_first',
    10: 'fourth_second',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).filter_questions,
                  style: AppTextStyles.font18DarkblueBold,
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: AppColors.darkblue),
                ),
              ],
            ),
            vGap(20),

            // Department Dropdown
            Text(
              S.of(context).department,
              style: AppTextStyles.font14BlackMedium,
            ),
            vGap(8),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGrayText),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: selectedDepartment,
                  hint: Text(
                    S.of(context).select_department,
                    style: AppTextStyles.font12grayMedium,
                  ),
                  items: departments.entries.map((entry) {
                    return DropdownMenuItem<int>(
                      value: entry.key,
                      child: Text(
                        _getLocalizedText(context, entry.value),
                        style: AppTextStyles.font14BlackRegular,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDepartment = value;
                    });
                  },
                ),
              ),
            ),
            vGap(16),

            // Semester Dropdown
            Text(
              S.of(context).semester,
              style: AppTextStyles.font14BlackMedium,
            ),
            vGap(8),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGrayText),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: selectedSemester,
                  hint: Text(
                    S.of(context).select_semester,
                    style: AppTextStyles.font12grayMedium,
                  ),
                  items: semesters.entries.map((entry) {
                    return DropdownMenuItem<int>(
                      value: entry.key,
                      child: Text(
                        _getLocalizedText(context, entry.value),
                        style: AppTextStyles.font14BlackRegular,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSemester = value;
                    });
                  },
                ),
              ),
            ),
            vGap(16),

            // Checkbox options
            CheckboxListTile(
              value: myQuestions,
              onChanged: (value) {
                setState(() {
                  myQuestions = value ?? false;
                });
              },
              title: Text(
                S.of(context).my_questions,
                style: AppTextStyles.font14BlackRegular,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.primaryColordark,
            ),
            CheckboxListTile(
              value: likedQuestions,
              onChanged: (value) {
                setState(() {
                  likedQuestions = value ?? false;
                });
              },
              title: Text(
                S.of(context).liked_questions,
                style: AppTextStyles.font14BlackRegular,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.primaryColordark,
            ),
            vGap(24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: CustomTextAndIconButton(
                    primaryButton: false,
                    text: S.of(context).clear_filter,
                    onTap: () {
                      setState(() {
                        selectedDepartment = null;
                        selectedSemester = null;
                        likedQuestions = false;
                        myQuestions = false;
                      });
                      widget.onFiltersApplied?.call(
                        department: null,
                        semester: null,
                        likes: null,
                        myQuestions: null,
                      );
                      Navigator.of(context).pop();
                    },
                    color: AppColors.darkblue,
                    icon: const Icon(Icons.clear, color: AppColors.white),
                  ),
                ),
                hGap(12),
                Expanded(
                  child: CustomTextAndIconButton(
                    primaryButton: true,
                    text: S.of(context).apply_filter,
                    onTap: () {
                      widget.onFiltersApplied?.call(
                        department: selectedDepartment,
                        semester: selectedSemester,
                        likes: likedQuestions ? true : null,
                        myQuestions: myQuestions ? true : null,
                      );
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.check, color: AppColors.white),
                  ),
                ),
              ],
            ),
            vGap(20),
          ],
        ),
      ),
    );
  }

  String _getLocalizedText(BuildContext context, String key) {
    final S localizations = S.of(context);
    switch (key) {
      case 'computer_science':
        return "computer science";
      case 'information_systems':
        return "information systems";
      case 'artificial_intelligence':
        return "artificial intelligence";
      case 'data_science':
        return "data science";
      case 'information_technology':
        return "information technology";
      case 'prep_first':
        return localizations.prep_first;
      case 'prep_second':
        return localizations.prep_second;
      case 'first_first':
        return localizations.first_first;
      case 'first_second':
        return localizations.first_second;
      case 'second_first':
        return localizations.second_first;
      case 'second_second':
        return localizations.second_second;
      case 'third_first':
        return localizations.third_first;
      case 'third_second':
        return localizations.third_second;
      case 'fourth_first':
        return localizations.fourth_first;
      case 'fourth_second':
        return localizations.fourth_second;
      default:
        return key;
    }
  }
}
