import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/map/presentation/widgets/custom_draggable_bottom_sheet.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../view models/map cubit/map_cubit.dart';
import 'custom_map_action_button.dart';
import 'flutter_map_with_layers.dart';
import 'recenter_button.dart';

class InternalMapRebuildBody extends StatefulWidget {
  const InternalMapRebuildBody({super.key});

  @override
  State<InternalMapRebuildBody> createState() => _InternalMapRebuildBodyState();
}

class _InternalMapRebuildBodyState extends State<InternalMapRebuildBody> {
  final mapController = MapController();
  bool _isBottomSheetOpen = false;
  MapState? _previousState;

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapState>(
      listenWhen: (previous, current) => previous != current,
      buildWhen: (previous, current) => previous != current,
      listener: (ctx, state) {
        // Show bottom sheet when a new route is fetched
        if (!_isBottomSheetOpen &&
            state.distance != null &&
            state.duration != null &&
            (_previousState == null ||
                _previousState!.distance == null ||
                _previousState!.duration == null ||
                // Check if distance or duration changed (new route)
                _previousState!.distance != state.distance ||
                _previousState!.duration != state.duration)) {
          _isBottomSheetOpen = true;
          showModalBottomSheet(
              context: ctx,
              isDismissible: true,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => CustomDraggableBottomSheet(
                    state: state,
                  )).whenComplete(() {
            _isBottomSheetOpen = false;
          });
        }
        // Close bottom sheet when route is reset
        if (_isBottomSheetOpen &&
            state.distance == null &&
            state.duration == null &&
            (_previousState != null &&
                (_previousState!.distance != null ||
                    _previousState!.duration != null))) {
          Navigator.pop(ctx, false);
          _isBottomSheetOpen = false;
        }
        _previousState = state;
      },
      builder: (context, state) {
        if (state.isLoading && state.currentLocation == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.darkblue,
            ),
          );
        }

        if (state.error != null && state.currentLocation == null) {
          return Center(child: Text(state.error!));
        }

        if (state.currentLocation == null) {
          return const Center(child: Text('Unable to load location'));
        }
        if (state.recenter) {
          mapController.move(state.currentLocation!, 17.0);
          context.read<MapCubit>().clearRecenter();
        }
        return Stack(
          children: [
            FlutterMapWithLayers(
              mapController: mapController,
              state: state,
            ),
            if (state.isLoading)
              Container(
                color: Colors.black.withOpacity(0.2),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.darkblue,
                  ),
                ),
              ),
            if (state.error != null)
              Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.redAccent,
                  child: Text(
                    state.error!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            Positioned(
              top: 10,
              left: 10,
              child: Column(
                children: [
                  CustomMapActionButton(
                    onPressed: () => context.read<MapCubit>().reset(),
                    tooltip: "reset",
                    child: const Icon(
                      Icons.refresh,
                    ),
                  ),
                  vGap(10),
                  CustomMapActionButton(
                    onPressed: () => mapController.rotate(0),
                    tooltip: "North",
                    child: Text("N", style: AppTextStyles.font14DarkBlueMedium),
                  ),
                  vGap(10),
                  CustomMapActionButton(
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => CustomDraggableBottomSheet(
                              isSearch: true,
                              state: state,
                            )),
                    tooltip: "Search",
                    child: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              bottom: 20.h,
              start: 10.w,
              child: const RecenterButton(),
            ),
          ],
        );
      },
    );
  }
}
