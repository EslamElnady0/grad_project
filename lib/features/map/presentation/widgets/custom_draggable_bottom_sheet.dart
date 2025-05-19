import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/map/presentation/view%20models/get_buildings_cubit/get_buildings_cubit.dart';
import 'package:grad_project/features/map/presentation/view%20models/get_halls_cubit/get_halls_cubit.dart';
import '../view models/map cubit/map_cubit.dart';
import 'destination_bottom_sheet_body.dart';
import 'search_halls_and_buildings_bottom_sheet_body.dart';

class CustomDraggableBottomSheet extends StatelessWidget {
  final MapState state;
  final String? destinationName;
  final bool isSearch;
  final double? initialChildSize;
  const CustomDraggableBottomSheet(
      {super.key,
      required this.state,
      this.initialChildSize,
      this.destinationName,
      this.isSearch = false});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize ?? 0.45,
      minChildSize: 0.25,
      maxChildSize: 0.6,
      builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: !isSearch
              ? DestinationBottomSheetBody(
                  scrollController: scrollController,
                  state: state,
                )
              : MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<GetHallsCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<GetBuildingsCubit>(),
                    ),
                  ],
                  child: SearchHallsAndBuildingsBottomSheetBody(
                    scrollController: scrollController,
                  ),
                )),
    );
  }
}
