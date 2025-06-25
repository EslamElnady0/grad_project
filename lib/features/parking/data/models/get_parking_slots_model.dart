import 'package:json_annotation/json_annotation.dart';

import '../enums/parking_enum.dart';

part 'get_parking_slots_model.g.dart';

@JsonSerializable()
class GetParkingSlotsResponse {
  final String message;
  final List<ParkingSlot> data;

  GetParkingSlotsResponse({
    required this.message,
    required this.data,
  });

  factory GetParkingSlotsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetParkingSlotsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetParkingSlotsResponseToJson(this);
}

@JsonSerializable()
class ParkingSlot {
  final String id;
  final String spotState;
  final int spotNumber;
  final String? userId;
  final String? endTime;

  ParkingSlot({
    this.userId,
    this.endTime,
    required this.id,
    required this.spotState,
    required this.spotNumber,
  });

  factory ParkingSlot.fromJson(Map<String, dynamic> json) =>
      _$ParkingSlotFromJson(json);
  Map<String, dynamic> toJson() => _$ParkingSlotToJson(this);

  ParkingEnum get parkingEnum {
    switch (spotState) {
      case 'empty':
        return ParkingEnum.empty;
      case 'full':
        return ParkingEnum.full;
      case 'reserved':
        return ParkingEnum.reserved;
      case 'unavailable':
        return ParkingEnum.unavailable;
      default:
        return ParkingEnum.empty;
    }
  }
}
