import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/core/widgets/custom_loading.dart';
import 'package:new_panel/core/widgets/empty_list.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/inventory_bloc.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/get_inventpries_status.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/new_inventory_list.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/selected_state_widget.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/summery_inventory.dart';

import 'package:new_panel/main.dart';
import 'package:new_panel/core/service_locator.dart';


class NewInventory extends StatelessWidget {
  NewInventory({Key? key}) : super(key: key);

  final TextEditingController searchbarController = TextEditingController();

  List<String> filterList =[] ;

  bool visibleSearch = false;
  bool inSelectedMode = false;
  GlobalKey<SummeryInventoryState> summaryInventoryKey = GlobalKey<SummeryInventoryState>();
  GlobalKey<NewInventoryListState> newInventoryListKey = GlobalKey<NewInventoryListState>();

  @override
  Widget build(BuildContext context) {

    return CustomBody(
      searchbarController: searchbarController,
      body: BlocProvider<InventoryBloc>(
        create: (context) => InventoryBloc(
            getInventoryUseCase: locator(),)..add(GetInventoriesEvent(stateType: '3'),
        ),
        child: Builder(
            builder: (context) {
              return Container(
                height: 674.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [

                    // inSelectedMode ?   SelectedStateWidget(
                    //   itemSelectedCount: [],
                    //   onTapDownButton: (){
                    //
                    //   },
                    //
                    // ) :
                    SummeryInventory(
                      filterList: filterList,
                      key: summaryInventoryKey,
                      onTapDoneButton: (){
                        newInventoryListKey.currentState?.isSelectedMode = false;
                        newInventoryListKey.currentState?.setState(() {

                        });
                      },

                    ),
                    BlocBuilder<InventoryBloc , InventoryState>(
                        builder: (context , state){

                          if(state.getInventoryStatus is GetInventoryLoading) {
                            return const Expanded(

                                child: Center(child: CustomLoading()));
                          }

                          if (state.getInventoryStatus is GetInventoryCompleted) {
                            GetInventoryCompleted successState =state.getInventoryStatus as GetInventoryCompleted;
                            List<InventoryEntity> inventoryList = successState.allInventory;
                            if(inventoryList.isEmpty) {
                              return  const Expanded(
                                child: EmptyOrErrorList(
                                  title: "No Cars Shared Yet!",
                                  subTitle: "Select +Add Inventory to Share car.",
                                  widgetType: WidgetType.emptyList,
                                ),
                              );
                            }
                            return  Flexible(
                              child: NewInventoryList(
                                key: newInventoryListKey,

                                inventories: inventoryList,

                                selectedListVehicle: (List<int> itemIdSelected) async{


                                  summaryInventoryKey.currentState?.inSelectedMode = true;
                                  summaryInventoryKey.currentState?.vehicleIdSelected = itemIdSelected;
                                  summaryInventoryKey.currentState?.setState(() {

                                  });
                                }, cancelSelectedMode: () {

                                summaryInventoryKey.currentState?.vehicleIdSelected.clear();
                                summaryInventoryKey.currentState?.inSelectedMode = false;
                                summaryInventoryKey.currentState?.setState(() {

                                });
                              } ,


                              ),
                            );
                          }
                          if(state.getInventoryStatus is GetInventoryError){
                            GetInventoryError getInventoryError = state.getInventoryStatus as GetInventoryError;
                            return   Expanded(
                              child: EmptyOrErrorList(
                                title: "Error",
                                subTitle: getInventoryError.responseError.message??"",
                                widgetType: WidgetType.error,

                              ),
                            );
                          }

                          return   const Expanded(

                              child: Center(child: CustomLoading()));
                        }


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
