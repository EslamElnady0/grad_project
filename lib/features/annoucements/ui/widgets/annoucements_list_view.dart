import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/failure_state_widget.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../generated/l10n.dart';
import '../ui cubit/announcement_filter_cubit.dart';
import 'annoucement_item.dart';

class AnnoucementsListView extends StatefulWidget {
  const AnnoucementsListView({super.key});

  @override
  State<AnnoucementsListView> createState() => _AnnoucementsListViewState();
}

class _AnnoucementsListViewState extends State<AnnoucementsListView> {
  String? userId;
  void getUserId() async {
    userId = await SharedPrefHelper.getString(Constants.userId);
    print(userId);
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }

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
              getAnnouncementSuccess: (data) =>
                  _buildAnnouncementsList(context, data, selectedFilters),
              getAnnouncementFailure: (error) =>
                  _buildFailureState(context, error),
              orElse: () => _buildLoadingList(),
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

  Widget _buildFailureState(BuildContext context, String error) {
    return FailureStateWidget(
      errorMessage: error,
      title: S.of(context).failedToLoadAnnouncements,
      icon: Icons.announcement_outlined,
      onRetry: () {
        context.read<GetAnnouncementCubit>().getAnnouncement();
        context.read<AllCoursesCubit>().get();
      },
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
        context.read<AllCoursesCubit>().get();
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          return AnnoucementItem(
            userId: userId ?? "",
            announcementModel: filteredItems[index],
          );
        },
      ),
    );
  }
}
