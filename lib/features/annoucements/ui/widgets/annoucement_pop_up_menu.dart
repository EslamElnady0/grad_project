import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import 'package:grad_project/features/annoucements/logic/delete_annoucement_cubit/delete_annoucement_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'package:grad_project/features/annoucements/ui/views/update_annoucement_view.dart';
import 'package:grad_project/generated/l10n.dart';

class AnnoucementPopUpMenu extends StatelessWidget {
  final Announcement announcement;
  const AnnoucementPopUpMenu({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      color: AppColors.darkblue,
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            GoRouter.of(context)
                .push(UpdateAnnoucementView.routeName, extra: announcement);
          },
          child: Row(
            children: [
              const Icon(
                Icons.edit,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).edit,
                style: AppTextStyles.font12WhiteMedium,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () async {
            await context
                .read<DeleteAnnoucementCubit>()
                .deleteAnnoucement(announcement.id.toString());
            if (context.mounted) {
              await context.read<GetAnnouncementCubit>().getAnnouncement();
            }
          },
          child: Row(
            children: [
              const Icon(
                Icons.delete,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).delete,
                style: AppTextStyles.font12WhiteMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
