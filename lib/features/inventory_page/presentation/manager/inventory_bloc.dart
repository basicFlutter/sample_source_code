import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/get_inventpries_status.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/inventory_page_status.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/search_inventory_status.dart';

import 'package:new_panel/main.dart';

import '../../domain/entities/inventory_entity.dart';
import '../../domain/use_cases/get_inventory_usecase.dart';

part 'inventory_event.dart';

part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  GetInventoryUseCase getInventoryUseCase;



  List<InventoryEntity> inventories = [];
  List<InventoryEntity> searchedInventories = [] ;

  InventoryBloc(
      {required this.getInventoryUseCase,})
      : super(InventoryState()) {


    on<ChangeSelectModeEvent>((event, emit) {
      emit(state.copyWith(
          newInventoryPageStatus: ChangeSelectModeStatus(isSelectMode: event.isSelectMode))
      );
    });




    on<GetInventoriesEvent>((event, emit) async {
      emit(state.copyWith(newInventoryStatus: GetInventoryLoading()));

      Either<ResponseError, List<InventoryEntity>> response =
          await getInventoryUseCase.call(event.stateType);

      response.fold((error) {
        emit(state.copyWith(newInventoryStatus: GetInventoryError(responseError: error)));
      }, (List<InventoryEntity> data) {
        inventories.addAll(data);
        emit(state.copyWith(
            newInventoryStatus: GetInventoryCompleted(allInventory: inventories, currentPageInventory: [])));
      });
    });


    on<GetWholeInventoriesEvent>((event, emit) {

    });

    on<SearchInventoryEvent>((event, emit) {
      logger.w('QUERY IS ${event.searchQuery}') ;



      if(event.searchQuery == ''){
        emit(state.copyWith(newInventoryStatus: GetInventoryCompleted(allInventory: inventories, currentPageInventory: [])));
      } else {
        searchedInventories.clear();
        for (var element in inventories) {
          if (element.age.toString().toLowerCase().contains(event.searchQuery.toString().toLowerCase()) ||
              element.vehicles!.modelYear.toString().toLowerCase().contains(event.searchQuery.toLowerCase()) ||
              element.vehicles!.make.toString().toLowerCase().contains(event.searchQuery.toLowerCase()) ||
              element.vehicles!.model.toString().toLowerCase().contains(event.searchQuery.toLowerCase()) ||
              element.vehicles!.bodyStyles.toString().toLowerCase().contains(event.searchQuery.toLowerCase()) ||
              element.vehicles!.vinNumber.toString().toLowerCase().contains(event.searchQuery.toLowerCase()) ||
              element.sellPrice.toString().toLowerCase().contains(event.searchQuery.toLowerCase()) ||
              element.specialPrice.toString().toLowerCase().contains(event.searchQuery.toLowerCase()) ||
            element.stockNO.toString().toLowerCase().contains(  event.searchQuery.toLowerCase()) ||
              element.odometer.toString().toLowerCase().contains(event.searchQuery.toLowerCase()) ||
              element.createdAt.toString().toLowerCase().contains(event.searchQuery.toLowerCase())
          ) {
            searchedInventories.add(element) ;
          }
        }
        emit(state.copyWith(newInventoryStatus: GetInventoryCompleted(allInventory: searchedInventories, currentPageInventory: [] , )));
      }
     });

  }

}
