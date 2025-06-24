import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../logic/parking_cubit/parking_cubit.dart';
import 'parking_slots_grid.dart';

class ParkingViewBody extends StatelessWidget {
  const ParkingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
      child: Column(
        children: [
          CustomInnerScreensAppBar(title: S.of(context).parkingSlots),
          vGap(12),
          TitleTextWidget(text: S.of(context).parkingSlotsDescription),
          vGap(24),
          BlocBuilder<ParkingCubit, ParkingState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<ParkingCubit>().fetchParkingSlots();
                },
                child: state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  parkingLoading: () => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColorlight,
                    ),
                  ),
                  parkingSuccess: (data) {
                    return ParkingSlotsGrid(slots: data.data);
                  },
                  parkingFailure: (error) =>
                      Center(child: Text('Error: $error')),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
