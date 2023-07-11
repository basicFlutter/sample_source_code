import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/core/widgets/custom_loading.dart';
import 'package:new_panel/core/widgets/empty_list.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/inventory_bloc.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/get_inventpries_status.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/new_inventory_list.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/summery_inventory.dart';

import 'package:new_panel/main.dart';
import 'package:new_panel/core/service_locator.dart';


class NewInventory extends StatelessWidget {
   NewInventory({Key? key}) : super(key: key);

  final TextEditingController searchbarController = TextEditingController();

  List<String> filterList =[] ;

  bool visibleSearch = false;

  @override
  Widget build(BuildContext context) {

    return CustomBody(
      searchbarController: searchbarController,
      body: BlocProvider<InventoryBloc>(
        create: (context) => InventoryBloc(
            getInventoryUseCase: locator(),
            getWholeInventoriesUseCase: locator())..add(GetInventoriesEvent(stateType: '3'),
        ),
        child: Builder(
          builder: (context) {
            return Container(
              height: 674.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  SummeryInventory(
                    filterList: filterList,
                  ),
                  BlocBuilder<InventoryBloc , InventoryState>(
                    builder: (context , state){
                      if(state.getInventoryStatus is LoadingGetInventoryStatus){
                        return const Expanded(child: CustomLoading());
                      }
                      if (state.getInventoryStatus is SuccessGetInventoryStatus) {
                        SuccessGetInventoryStatus successState =state.getInventoryStatus as SuccessGetInventoryStatus;
                        List<InventoryEntity> inventoryList = successState.allInventory;
                        if(inventoryList.isEmpty) {
                          return  const Expanded(
                            child: EmptyList(
                            title: "No Cars Shared Yet!",
                            subTitle: "Select +Add Inventory to Share car.",
                        ),
                          );
                        }
                        return  Flexible(
                          child: NewInventoryList(
                            inventories: inventoryList ,
                          ),
                        );
                      }
                      return const CustomLoading();
                    },
                  )

                ],
              ),
            );
          }
        ),
      ),

    );
  }
}
