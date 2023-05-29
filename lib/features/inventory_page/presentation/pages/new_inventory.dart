import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/core/widgets/custom_tag.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/inventory_bloc.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/get_inventpries_status.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/inventory_page_status.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/new_inventory_list.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/summery_inventory.dart';
import 'package:new_panel/main.dart';

class NewInventory extends StatefulWidget {
  const NewInventory({Key? key}) : super(key: key);

  @override
  State<NewInventory> createState() => _NewInventoryState();
}

class _NewInventoryState extends State<NewInventory> {
  final TextEditingController searchbarController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
   List<String> filterList = ["adfasdfadsf"];
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                SummeryInventory(filterList: [],),
                BlocBuilder<InventoryBloc , InventoryState>(
                  builder: (context , state){
                    if(state.getInventoryStatus is LoadingGetInventoryStatus){
                      return Center(child: CircularProgressIndicator());
                    }
                    if(state.inventoryPageStatus is ChangeSelectModeStatus){
                      ChangeSelectModeStatus cha = state.inventoryPageStatus as ChangeSelectModeStatus;
                      if(cha.isSelectMode){
                        filterList = ["fasdf"];
                      }else{
                        filterList.clear();
                      }
                    }
                    if (state.getInventoryStatus is SuccessGetInventoryStatus) {
                      SuccessGetInventoryStatus successState =state.getInventoryStatus as SuccessGetInventoryStatus;
                      List<InventoryEntity> inventoryList = successState.allInventory;
                      logger.w(inventoryList.length);
                      return  NewInventoryList(inventories: inventoryList ,summeryIsExpanded: filterList.isNotEmpty,);
                    }
                    return SizedBox();

                  },
                )

              ],
            );
          }
        ),
      ),

    );
  }
}
