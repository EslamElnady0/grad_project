part of 'map_cubit.dart';

@immutable
class MapState {
  final bool isLoading;
  final LatLng? currentLocation;
  final List<Marker> markers;
  final List<LatLng> routePoints;
  final List<RouteInstruction> instructions;
  final String? error;
  final bool recenter;

  const MapState({
    this.isLoading = false,
    this.currentLocation,
    this.markers = const [],
    this.routePoints = const [],
    this.instructions = const [],
    this.error,
    this.recenter = false,
  });

  const MapState.initial() : this();

  const MapState.loading() : this(isLoading: true);

  const MapState.loaded({
    required LatLng currentLocation,
    required List<Marker> markers,
    required List<LatLng> routePoints,
    required List<RouteInstruction> instructions,
  }) : this(
          isLoading: false,
          currentLocation: currentLocation,
          markers: markers,
          routePoints: routePoints,
          instructions: instructions,
        );

  const MapState.error(String error)
      : this(
          isLoading: false,
          error: error,
        );

  MapState copyWith({
    bool? isLoading,
    LatLng? currentLocation,
    List<Marker>? markers,
    List<LatLng>? routePoints,
    List<RouteInstruction>? instructions,
    String? error,
    bool? recenter,
  }) {
    return MapState(
      isLoading: isLoading ?? this.isLoading,
      currentLocation: currentLocation ?? this.currentLocation,
      markers: markers ?? this.markers,
      routePoints: routePoints ?? this.routePoints,
      instructions: instructions ?? this.instructions,
      error: error,
      recenter: recenter ?? this.recenter,
    );
  }
}
