import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/widgets/custom_text_and_icon_button.dart';
import 'package:grad_project/features/forum/presentation/views/widgets/custom_forum_item.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../../home/ui/widgets/title_text_widget.dart';

class ForumViewsBody extends StatelessWidget {
  const ForumViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Padding(
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
                vGap(8),
                Row(children: [
                  CustomTextAndIconButton(
                    primaryButton: true,
                    text: S.of(context).add_your_question,
                    onTap: () {},
                    icon: Icon(Icons.add),
                  ),
                  Spacer(),
                  CustomTextAndIconButton(
                    primaryButton: false,
                    text: S.of(context).filter,
                    onTap: () {},
                    icon: Icon(Icons.tune),
                  ),
                ]),
                vGap(8),
                Text("48 سؤال حتي الآن!",
                    style: AppTextStyles.font12GrayMedium),
                vGap(8),
              ],
            )),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => CustomForumItem(),
          childCount: 10,
        ),
      ),
    ]);
  }
}
