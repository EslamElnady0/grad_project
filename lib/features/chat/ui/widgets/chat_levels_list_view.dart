import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import 'chat_levels_item.dart';

class ChatLevelsListView extends StatelessWidget {
  const ChatLevelsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => ChatLevelsItem(
        title: 'Level 1',
        index: index,
      ),
      itemCount: 4,
      separatorBuilder: (context, index) => vGap(12),
    );
  }
}
