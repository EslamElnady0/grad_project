import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../../home/ui/widgets/title_text_widget.dart';

class ForumViewsBody extends StatelessWidget {
  const ForumViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            vGap(22),
            HomeScreensHeaderRow(
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
              onSearchTap: () {},
            ),
            vGap(12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TitleTextWidget(
                text: S.of(context).forum_welcome_message,
              ),
            ),
            vGap(12),
          ],
        ));
  }
}
