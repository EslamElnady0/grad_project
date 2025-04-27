import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
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
              getAnnouncementLoading: () => _buildLoadingList(),
              getAnnouncementSuccess: (data) =>
                  _buildAnnouncementsList(context, data, selectedFilters),
              getAnnouncementFailure: (error) => _buildErrorState(error),
              orElse: () => const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }

  Widget _buildLoadingList() {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) => const AnnouncemectSkeletonItem(),
      ),
    );
  }

  Widget _buildAnnouncementsList(BuildContext context,
      PaginatedAnnouncementsResponse data, Set<String> selectedFilters) {
    final items = data.data.data;
    final filteredItems = items.where((announcement) {
      final subject = announcement.course.name.toLowerCase();
      return selectedFilters.isEmpty ||
          selectedFilters
              .any((filter) => subject.contains(filter.toLowerCase()));
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
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: AppColors.redlight),
      ),
    );
  }
}
