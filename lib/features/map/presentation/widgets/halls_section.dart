import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/events/map%20events/add_destination_event.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/map/data/model/get_halls_response.dart';
import 'package:grad_project/features/map/presentation/widgets/search_result_list.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/events/message events/messages_events.dart';
import '../view models/get_halls_cubit/get_halls_cubit.dart';

class HallsSection extends StatelessWidget {
  final String searchQuery;
  final ValueNotifier<bool> showDropdownNotifier;
  final TextEditingController searchController;
  const HallsSection(
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
            S.of(context).halls,
            style: AppTextStyles.font16DarkerBlueBold,
          ),
        ),
        BlocBuilder<GetHallsCubit, GetHallsState>(
          builder: (context, state) => state.maybeWhen(
            getHallsSuccess: (data) {
              data as GetHallsResponse;
              return SearchResultList(
                items: data.data,
                searchQuery: searchQuery,
                noItemsText: S.of(context).noHallsFound,
                onItemSelected: (item) {
                  showDropdownNotifier.value = false;
                  searchController.text = item.name;
                  double longitude = double.parse(item.longitude);
                  double latitude = double.parse(item.latitude);
                  LatLng destination = LatLng(latitude, longitude);
                  context.pop();
                  eventBus.fire(AddDestinationEvent<HallData>(
                      destination: destination, destObject: item));
                },
              );
            },
            getHallsFailure: (error) => Padding(
              padding: EdgeInsets.all(16.w),
              child: TextButton(
                onPressed: () => context.read<GetHallsCubit>().getHalls(),
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
