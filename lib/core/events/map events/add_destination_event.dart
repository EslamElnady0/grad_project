import 'package:latlong2/latlong.dart';

class AddDestinationEvent<T> {
  final LatLng destination;
  final T destObject;

  AddDestinationEvent({required this.destination, required this.destObject});
}
