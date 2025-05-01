import 'package:flutter/material.dart';

import '../theme/app_colors.dart' show AppColors;
import '../theme/app_text_styles.dart';

class CustomExpansionTile extends StatefulWidget {
  final String day;
  final bool isExpanded;
  final Function(bool) onExpansionChanged;
  final List<Widget> children;

  const CustomExpansionTile({
    super.key,
    required this.day,
    required this.isExpanded,
    required this.onExpansionChanged,
    required this.children,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
   bool _isExpanded = false;  // Local state to track expansion

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }
@override
Widget build(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.zero, // Removes all horizontal padding
      ),
    ),
    child: ExpansionTile(
      showTrailingIcon: false,
      shape: Border.all(color: Colors.transparent),
      title: Text(
        widget.day,
        style: AppTextStyles.font18DarkblueBold,
      ),
      leading: AnimatedRotation(
        turns:  _isExpanded ? -0.25 : 0,
        duration: const Duration(milliseconds: 200),
        child: const Icon(
          Icons.chevron_right,
          color: AppColors.darkblue,
          size: 30,
        ),
      ),
    onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;  // Update local state
          });
          widget.onExpansionChanged(value);  // Call parent callback
        },
      children: widget.children,
    ),
  );
}
}
