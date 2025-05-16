part of 'map_cubit.dart';

@immutable
class MapState extends Equatable {
  final bool isLoading;
  final LatLng? currentLocation;
  final List<Marker> markers;
  final List<LatLng> routePoints;
  final List<RouteInstruction> instructions;
  final String destName;
  final String? error;
  final bool recenter;
  final double? distance;
  final double? duration;

  const MapState({
    this.isLoading = false,
    this.currentLocation,
    this.destName = '',
    this.markers = const [],
    this.routePoints = const [],
    this.instructions = const [],
    this.error,
    this.recenter = false,
    this.distance,
    this.duration,
  });

  const MapState.initial() : this();

  const MapState.loading() : this(isLoading: true);

  const MapState.loaded({
    required LatLng currentLocation,
    required List<Marker> markers,
    required List<LatLng> routePoints,
    required List<RouteInstruction> instructions,
    double? distance,
    double? duration,
  }) : this(
          isLoading: false,
          currentLocation: currentLocation,
          markers: markers,
          routePoints: routePoints,
          instructions: instructions,
          distance: distance,
          duration: duration,
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
    double? distance,
    double? duration,
    String? destName,
  }) {
    return MapState(
      isLoading: isLoading ?? this.isLoading,
      currentLocation: currentLocation ?? this.currentLocation,
      markers: markers ?? this.markers,
      routePoints: routePoints ?? this.routePoints,
      instructions: instructions ?? this.instructions,
      error: error,
      recenter: recenter ?? this.recenter,
      destName: destName ?? this.destName,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        currentLocation,
        markers,
        routePoints,
        instructions,
        error,
        recenter,
        distance,
        duration,
        destName
      ];
}
