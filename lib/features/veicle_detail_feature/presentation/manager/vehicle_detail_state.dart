part of 'vehicle_detail_bloc.dart';

class VehicleDetailState {
  final GetInventoryImagesStatus getInventoryImagesStatus;
  const VehicleDetailState({required this.getInventoryImagesStatus});

  VehicleDetailState copyWith({GetInventoryImagesStatus? newGetInventoryImagesStatus}){

    return VehicleDetailState(getInventoryImagesStatus:newGetInventoryImagesStatus?? getInventoryImagesStatus);

  }

}

