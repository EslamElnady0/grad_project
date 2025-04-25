import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'annoucement_item.dart';

class AnnoucementsListView extends StatelessWidget {
  const AnnoucementsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAnnouncementCubit, GetAnnouncementState>(
      buildWhen: (previous, current) =>
          current is GetAnnouncementLoading ||
          current is GetAnnouncementSuccess ||
          current is GetAnnouncementFailure,
      builder: (context, state) => state.maybeWhen(
        getAnnouncementLoading: () {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColorlight,
            ),
          );
        },
        getAnnouncementSuccess: (data) {
          final responseData = data as PaginatedAnnouncementsResponse;
          final items = responseData.data.data;

          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return AnnoucementItem(
                announcementModel: items[index],
              );
            },
          );
        },
        getAnnouncementFailure: (error) {
          return Center(
            child: Text(
              error,
              style: const TextStyle(color: AppColors.redlight),
            ),
          );
        },
        orElse: () {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColorlight,
            ),
          );
        },
      ),
    );
  }
}
