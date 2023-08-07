part of 'vehicle_detail_bloc.dart';

abstract class VehicleDetailEvent extends Equatable {
  const VehicleDetailEvent();
}


class GetInventoryImages extends VehicleDetailEvent{
  final int vehicleId;
  const GetInventoryImages({required this.vehicleId});

  @override
  List<Object?> get props => [vehicleId];

}
