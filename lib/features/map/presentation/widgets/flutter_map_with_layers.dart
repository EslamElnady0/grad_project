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

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: state.currentLocation!,
        initialZoom: 17.0,
        onTap: (tapPosition, point) =>
            context.read<MapCubit>().addDestination(point, ""),
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
