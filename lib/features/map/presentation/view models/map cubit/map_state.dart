part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

final class MapSeaching extends MapState {}

final class MapSuccess extends MapState {}

final class MapFailure extends MapState {}
