import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/inventory_page_status.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc() : super(InventoryState()) {
    on<InventoryEvent>((event, emit) {

    });
    
    on<ChangeSelectModeEvent>((event, emit) {
      emit(state.copyWith(newInventoryPageStatus:ChangeSelectModeStatus(isSelectMode: event.isSelectMode ) ) );
    });
  }
}

