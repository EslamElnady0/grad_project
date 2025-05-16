import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import '../view models/map cubit/map_cubit.dart';

class InternalMapRebuildBody extends StatelessWidget {
  const InternalMapRebuildBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mapController = MapController();

    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state.isLoading && state.currentLocation == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null && state.currentLocation == null) {
          return Center(child: Text(state.error!));
        }

        if (state.currentLocation == null) {
          return const Center(child: Text('Unable to load location'));
        }

        // Recenter map if requested
        if (state.recenter) {
          mapController.move(state.currentLocation!, 17.0);
          context.read<MapCubit>().clearRecenter();
        }
        return Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: state.currentLocation!,
                initialZoom: 17.0,
                onTap: (tapPosition, point) =>
                    context.read<MapCubit>().addDestination(point),
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(markers: state.markers),
                if (state.routePoints.isNotEmpty) // Add this condition
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: state.routePoints,
                        strokeWidth: 4.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
              ],
            ),
            if (state.isLoading)
              Container(
                color: Colors.black.withOpacity(0.2),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(child: CircularProgressIndicator()),
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
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => context.read<MapCubit>().reset(),
                  icon: const Icon(Icons.refresh),
                  color: AppColors.darkblue,
                ),
              ),
            ),
            // Instructions button, visible only if there are instructions
            // if (state.instructions.isNotEmpty)
            //   Positioned(
            //     top: 60,
            //     left: 10,
            //     child: ElevatedButton.icon(
            //       onPressed: () {
            //         // Navigator.push(
            //         //   context,
            //         //   MaterialPageRoute(
            //         //     builder: (context) => InstructionsScreen(
            //         //       instructions: state.instructions,
            //         //     ),
            //         //   ),
            //         // );
            //       },
            //       icon: const Icon(Icons.directions),
            //       label: const Text('Instructions'),
            //     ),
            //   ),
            PositionedDirectional(
              bottom: 20.h,
              start: 10.w,
              child: FloatingActionButton(
                backgroundColor: AppColors.white,
                onPressed: () => context.read<MapCubit>().recenter(),
                child: const Icon(
                  Icons.my_location,
                  color: AppColors.darkblue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
