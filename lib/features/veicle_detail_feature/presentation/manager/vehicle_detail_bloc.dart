

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/entities/inventory_image_entity.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/use_cases/get_image_slider_useCase.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/manager/status/get_inventroy_images_status.dart';

part 'vehicle_detail_event.dart';
part 'vehicle_detail_state.dart';

class VehicleDetailBloc extends Bloc<VehicleDetailEvent, VehicleDetailState> {

  GetImageSliderUseCase getImageSliderUseCase;
  List<String> imageList = [
  "/medallionmotors/2013-MINI-CooperCountryman-0-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-1-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-2-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-3-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-4-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-5-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-6-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-7-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-8-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-9-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-10-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-11-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-12-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-13-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-14-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-15-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-16-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-17-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-18-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-19-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-20-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-21-70209.jpg",
  "/medallionmotors/2013-MINI-CooperCountryman-22-70209.jpg",
  ];

  VehicleDetailBloc({required this.getImageSliderUseCase}) : super(VehicleDetailState(getInventoryImagesStatus: GetInventoryImagesInit())) {

    on<GetInventoryImages>((event, emit) async{
      emit(state.copyWith(newGetInventoryImagesStatus: GetInventoryImagesLoading()));
      Either<ResponseError , List<InventoryImageEntity>> response = await getImageSliderUseCase(event.vehicleId);

      response.fold((ResponseError responseError){
        emit(state.copyWith(newGetInventoryImagesStatus: GetInventoryImagesError(responseError: responseError)));
      }, (List<InventoryImageEntity> inventoryImageListEntity) {
        for(var item in imageList){
          inventoryImageListEntity.add(InventoryImageEntity(
            mediaSrc: item
          ));
        }
        /// this revered used for scroll animation and in listView.builder is revers to main list
        if(inventoryImageListEntity.length > 4){
          inventoryImageListEntity = inventoryImageListEntity.reversed.toList();
        }


        emit(state.copyWith(newGetInventoryImagesStatus: GetInventoryImagesCompleted(inventoryImageList: inventoryImageListEntity)));
      });



    });

  }
}
