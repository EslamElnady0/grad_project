import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:grad_project/core/events/map%20events/add_destination_event.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/map/data/model/get_halls_response.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '../../../../../core/events/message events/messages_events.dart';
import '../../../data/model/get_buildings_response.dart';
import '../../../data/model/route_response.dart';
import '../../../data/repos/map_repo.dart';
import 'package:rxdart/rxdart.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final MapRepo _mapRepo;
  StreamSubscription<LocationData>? _locationSubscription;
  StreamSubscription<AddDestinationEvent>? _addDestinationSubscription;
  MapCubit(this._mapRepo) : super(const MapState.initial()) {
    _addDestinationSubscription =
        eventBus.on<AddDestinationEvent>().listen((event) {
      var object = event.destObject;
      if (object is HallData) {
        addDestination(event.destination, "${object.name} ${object.code}");
      } else if (object is BuildingModel) {
        addDestination(event.destination, "${object.name} ${object.code}");
      }
    });
  }

  void init({LatLng? destinationCoordinates, String? destinationName}) async {
    emit(const MapState.loading());
    try {
      final location = await _mapRepo.getCurrentLocation();
      final marker = Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(location.latitude!, location.longitude!),
        child: const Icon(Icons.my_location,
            color: AppColors.darkblue, size: 35.0),
      );
      emit(MapState.loaded(
        currentLocation: LatLng(location.latitude!, location.longitude!),
        markers: [marker],
        routePoints: const [],
        instructions: const [],
      ));

      // Debounce location updates to reduce rebuilds
      _locationSubscription = _mapRepo
          .onLocationChanged()
          .debounceTime(const Duration(milliseconds: 1000))
          .listen((newLocation) {
        final updatedMarker = Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(newLocation.latitude!, newLocation.longitude!),
          child: const Icon(Icons.my_location,
              color: AppColors.darkblue, size: 35.0),
        );
        emit(state.copyWith(
          currentLocation:
              LatLng(newLocation.latitude!, newLocation.longitude!),
          markers: [
            updatedMarker,
            if (state.markers.length > 1) state.markers[1],
          ],
        ));
      });
      // If destination coordinates are provided, add the destination
      if (destinationCoordinates != null && destinationName != null) {
        addDestination(destinationCoordinates, destinationName);
      }
    } catch (e) {
      emit(MapState.error(e.toString()));
    }
  }

  void addDestination(LatLng destination, String? destName) async {
    if (state.currentLocation == null) return;

    emit(state.copyWith(isLoading: true));
    final routeResponse =
        await _mapRepo.getRoute(state.currentLocation!, destination);

    routeResponse.when(success: (route) {
      if (route.routePoints.isEmpty) {
        // Handle empty route case
        emit(state.copyWith(
          error: "No route found",
          isLoading: false,
        ));
        return;
      }
      final destinationMarker = Marker(
        width: 80.0,
        height: 80.0,
        point: destination,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
      );
      emit(state.copyWith(
        markers: [state.markers[0], destinationMarker],
        routePoints: route.routePoints,
        instructions: route.instructions,
        distance: route.distance,
        destName: destName,
        duration: route.duration,
        isLoading: false,
      ));
    }, failure: (e) {
      emit(state.copyWith(
        error: e.getAllMessages(),
        isLoading: false,
      ));
    });
  }

  void reset() {
    if (state.currentLocation == null) return;
    final marker = Marker(
      width: 80.0,
      height: 80.0,
      point: state.currentLocation!,
      child:
          const Icon(Icons.my_location, color: AppColors.darkblue, size: 35.0),
    );
    emit(state.copyWith(
      markers: [marker],
      routePoints: [],
      instructions: [],
      distance: null,
      destName: null,
      duration: null,
      error: null,
    ));
  }

  void recenter() {
    if (state.currentLocation != null) {
      emit(state.copyWith(recenter: true));
    }
  }

  void clearRecenter() {
    emit(state.copyWith(recenter: false));
  }

  @override
  Future<void> close() {
    _locationSubscription?.cancel();
    _addDestinationSubscription?.cancel();
    return super.close();
  }
}
