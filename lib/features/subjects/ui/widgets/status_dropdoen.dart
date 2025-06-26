import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
class StatusDropdown extends StatefulWidget {
  const StatusDropdown({super.key});

  @override
  State<StatusDropdown> createState() => _StatusDropdownState();
}

class _StatusDropdownState extends State<StatusDropdown> {
  late String selectedStatus;
  late List<String> statusList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
 
    statusList = [
      S.of(context).completed,
      S.of(context).in_progress,
      S.of(context).not_started,
    ];
    selectedStatus = statusList[0]; 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          value: selectedStatus,
          items: statusList.map((String status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Text(
                status,
                style: AppTextStyles.font10grayMedium,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedStatus = newValue!;
            });
          },
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ),
      ),
    );
  }
}
