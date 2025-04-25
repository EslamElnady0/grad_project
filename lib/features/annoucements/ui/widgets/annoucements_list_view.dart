import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import '../ui cubit/announcement_filter_cubit.dart';
import 'annoucement_item.dart';

class AnnoucementsListView extends StatelessWidget {
  const AnnoucementsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementFilterCubit, Set<String>>(
      builder: (context, selectedFilters) {
        return BlocBuilder<GetAnnouncementCubit, GetAnnouncementState>(
          buildWhen: (previous, current) =>
              current is GetAnnouncementLoading ||
              current is GetAnnouncementSuccess ||
              current is GetAnnouncementFailure,
          builder: (context, state) {
            return state.maybeWhen(
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

                // Filter the announcements based on the selected subject(s)
                final filteredItems = items.where((announcement) {
                  final subject = announcement.course.name.toLowerCase();
                  return selectedFilters.isEmpty ||
                      selectedFilters.any(
                          (filter) => subject.contains(filter.toLowerCase()));
                }).toList();

                return RefreshIndicator(
                  color: AppColors.primaryColorlight,
                  onRefresh: () async {
                    context.read<GetAnnouncementCubit>().getAnnouncement();
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return AnnoucementItem(
                        announcementModel: filteredItems[index],
                      );
                    },
                  ),
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
            );
          },
        );
      },
    );
  }
}
