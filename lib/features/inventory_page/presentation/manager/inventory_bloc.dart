import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/get_inventpries_status.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/inventory_page_status.dart';

import '../../../../core/exceptions/failure.dart';
import '../../domain/entities/inventory_entity.dart';
import '../../domain/use_cases/get_inventory_usecase.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {

  GetInventoryUseCase getInventoryUseCase ;

  List<InventoryEntity> inventories = [];

  InventoryBloc({ required this.getInventoryUseCase}) : super(InventoryState()) {
    on<InventoryEvent>((event, emit) {});
    
    on<ChangeSelectModeEvent>((event, emit) {
      emit(state.copyWith(newInventoryPageStatus:ChangeSelectModeStatus(isSelectMode: event.isSelectMode ) ) );
    });

    on<GetInventoriesEvent>((event, emit) async {
      emit(state.copyWith(newInventoryStatus: LoadingGetInventoryStatus()));

      Either<Failure, List<InventoryEntity>> response = await getInventoryUseCase.call(event.stateType);

      response.fold((error){
        emit(state.copyWith(newInventoryStatus: FailedGetInventoryStatus())) ;
      } , (List<InventoryEntity> data ){
        inventories.addAll(data);
         emit(state.copyWith(newInventoryStatus: SuccessGetInventoryStatus(inventories: inventories)));
      }) ;
    });


    on<GetWholeInventoriesEvent>((event, emit) {});

  }
}

