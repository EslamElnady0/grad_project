import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class CustomRadioButton extends StatelessWidget {
  final int value;
  final int? groupValue;
  final ValueChanged<int?> onChanged;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        width: 20.r,
        height: 20.r,
        decoration: BoxDecoration(
          color: _isSelected ? AppColors.darkblue : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: _isSelected ? AppColors.darkblue : Colors.grey[600]!,
            width: 1.5,
          ),
        ),
        child: _isSelected
            ? const Icon(
                Icons.check,
                size: 14,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
