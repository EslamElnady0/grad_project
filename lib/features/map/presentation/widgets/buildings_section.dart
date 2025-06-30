import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/map/data/model/get_buildings_response.dart';
import 'package:grad_project/features/map/presentation/widgets/search_result_list.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/events/map events/add_destination_event.dart';
import '../../../../core/events/message events/messages_events.dart';
import '../view models/get_buildings_cubit/get_buildings_cubit.dart';

class BuildingsSection extends StatelessWidget {
  final String searchQuery;
  final ValueNotifier<bool> showDropdownNotifier;
  final TextEditingController searchController;
  const BuildingsSection(
      {super.key,
      required this.searchQuery,
      required this.showDropdownNotifier,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          child: Text(
            S.of(context).buildings,
            style: AppTextStyles.font16DarkerBlueBold,
          ),
        ),
        BlocBuilder<GetBuildingsCubit, GetBuildingsState>(
          builder: (context, state) => state.maybeWhen(
            getBuildingsSuccess: (data) {
              data as GetBuildingsResponse;
              return SearchResultList(
                items: data.data,
                searchQuery: searchQuery,
                noItemsText: S.of(context).noBuildingsFound,
                onItemSelected: (item) {
                  showDropdownNotifier.value = false;
                  searchController.text = item.name;
                  double longitude = double.parse(item.longitude);
                  double latitude = double.parse(item.latitude);
                  LatLng destination = LatLng(latitude, longitude);
                  context.pop();
                  eventBus.fire(AddDestinationEvent<BuildingModel>(
                      destination: destination, destObject: item));
                },
              );
            },
            getBuildingsFailure: (error) => Padding(
              padding: EdgeInsets.all(16.w),
              child: TextButton(
                onPressed: () =>
                    context.read<GetBuildingsCubit>().getBuildings(),
                child: Text(
                  "error, ${S.of(context).retry}",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font14DarkBlueMedium,
                ),
              ),
            ),
            orElse: () => Padding(
              padding: EdgeInsets.all(16.w),
              child: const CircularProgressIndicator(
                color: AppColors.darkblue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
