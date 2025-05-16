import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

import '../view models/map cubit/map_cubit.dart';

class FlutterMapWithLayers extends StatelessWidget {
  final MapController mapController;
  final MapState state;
  const FlutterMapWithLayers(
      {super.key, required this.mapController, required this.state});
  // Format distance (meters to km or m)
  // String formatDistance(double distance) {
  //   if (distance < 1000) {
  //     return '${distance.toStringAsFixed(0)} m';
  //   }
  //   return '${(distance / 1000).toStringAsFixed(1)} km';
  // }

  // // Format duration (seconds to min or hr)
  // String formatDuration(double duration) {
  //   if (duration < 3600) {
  //     return '${(duration / 60).toStringAsFixed(1)} min';
  //   }
  //   return '${(duration / 3600).toStringAsFixed(1)} hr';
  // }
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
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
        if (state.routePoints.isNotEmpty)
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
    );
  }
}
