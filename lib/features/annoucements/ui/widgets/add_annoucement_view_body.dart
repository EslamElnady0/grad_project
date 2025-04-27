import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';
import 'package:grad_project/features/annoucements/ui/widgets/drop_down_and_displays.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_inner_screens_app_bar.dart';
import '../../../../generated/l10n.dart';
import 'title_and_desc_text_fields.dart';
import 'date_and_time_section.dart';
import 'publish_row.dart';

class AddAnnoucementViewBody extends StatefulWidget {
  const AddAnnoucementViewBody({super.key});

  @override
  State<AddAnnoucementViewBody> createState() => _AddAnnoucementViewBodyState();
}

class _AddAnnoucementViewBodyState extends State<AddAnnoucementViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInnerScreensAppBar(title: S.of(context).add_new),
            TitleTextWidget(text: S.of(context).add_new_news),
            vGap(8),
            TitleAndDescTextFields(
              title: S.of(context).news_title,
              titleHintText: S.of(context).news_title_description,
              desc: S.of(context).news_content,
              descHintText: S.of(context).news_content_description,
              formKey: context.read<AddAnnoucementsCubit>().formKey,
              titleController:
                  context.read<AddAnnoucementsCubit>().titleController,
              descController:
                  context.read<AddAnnoucementsCubit>().descController,
            ),
            vGap(12),
            const DropDownAndDisplays(),
            vGap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).schedule_publish_time,
                  style: AppTextStyles.font14BlackBold
                      .copyWith(color: AppColors.darkerBlue),
                ),
                vGap(12),
                Text(S.of(context).publish_time_description,
                    style: AppTextStyles.font12GrayMedium),
              ],
            ),
            vGap(8),
            const DateAndTimeSection(),
            vGap(20),
            const PublishRow(),
          ],
        ),
      ),
    );
  }
}
