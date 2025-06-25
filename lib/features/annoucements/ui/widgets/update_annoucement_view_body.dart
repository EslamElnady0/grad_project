import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'package:grad_project/features/annoucements/logic/update_annoucement_cubit/update_annoucement_cubit.dart';
import 'package:grad_project/features/annoucements/ui/widgets/edit_drop_down_and_displays.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_inner_screens_app_bar.dart';
import '../../../../generated/l10n.dart';
import 'title_and_desc_text_fields.dart';
import 'date_and_time_section.dart';
import '../../../../core/widgets/publish_row.dart';

class UpdateAnnoucementViewBody extends StatelessWidget {
  const UpdateAnnoucementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Announcement announcement = context.read<Announcement>();
    context.read<UpdateAnnoucementCubit>().titleController.text =
        announcement.title ?? "";
    context.read<UpdateAnnoucementCubit>().descController.text =
        announcement.body;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInnerScreensAppBar(title: S.of(context).editAnnouncement),
            TitleTextWidget(text: S.of(context).edit_news),
            vGap(8),
            TitleAndDescTextFields(
              title: S.of(context).news_title,
              titleHintText: S.of(context).news_title_description,
              desc: S.of(context).news_content,
              descHintText: S.of(context).news_content_description,
              formKey: context.read<UpdateAnnoucementCubit>().formKey,
              titleController:
                  context.read<UpdateAnnoucementCubit>().titleController,
              descController:
                  context.read<UpdateAnnoucementCubit>().descController,
            ),
            vGap(12),
            const EditDropDownAndDisplays(),
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
            const DateAndTimeSection(
              isEdit: true,
            ),
            vGap(20),
            PublishRow(
              onTap: () async {
                if (context
                    .read<UpdateAnnoucementCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  await context
                      .read<UpdateAnnoucementCubit>()
                      .updateAnnoucement(context.read<Announcement>());
                  if (context.mounted) {
                    await context
                        .read<GetAnnouncementCubit>()
                        .getAnnouncement();
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
