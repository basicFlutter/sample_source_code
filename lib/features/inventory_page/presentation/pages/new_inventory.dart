import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/core/widgets/custom_tag.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/inventory_bloc.dart';
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
  @override
  Widget build(BuildContext context) {

    return CustomBody(
      searchbarController: searchbarController,
      body: BlocProvider<InventoryBloc>(
        create: (context) => InventoryBloc(
            getInventoryUseCase: locator(),
            getWholeInventoriesUseCase: locator()),
          //..add(GetInventoriesEvent(stateType: '3')),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            SummeryInventory(),
            const NewInventoryList()
          ],
        ),
      ),

    );
  }
}
