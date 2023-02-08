import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_dimensions.dart';
import 'package:new_panel/features/inventory_detail_feature/presentation/widgets/inventory_slider.dart';

import '../../../../core/widgets/custom_tabBar.dart';
import '../../../../core/widgets/searchbar_widget.dart';
import '../widgets/inventory_detail.dart';

class InventoryDetailPage extends StatelessWidget {
  InventoryDetailPage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 1.sh,
          child: Stack(
            children: [
              Column(
                children: [
                  const CustomTabBar(),
                  SearchbarWidget(
                    searchbarController: searchController,
                    fieldHint: 'Find your car ( Year, Make, Model )',
                  ),
                  const InventorySlider(),
                ],
              ),
              _detailContent(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailContent(BuildContext context) {
    return Positioned(
      top: 381.h,
      child: Container(
        width: 1.sw,
        // height: 485.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: Theme.of(context).colorScheme.background),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buttons(context) ,
            const InventoryDetail()
          ],
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Padding(
              padding:  EdgeInsets.only(right: 29.w , left: 29.w , top:16.h ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _backButton(context),
                  _editButton(context)
                ],
              ),
            );
  }

  Widget _editButton(BuildContext context) {
    return TextButton(onPressed: (){
      Navigator.of(context).pop() ;
    }, child: Container(
                    height: 30.h,
                    width: 74.w
                    ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        color:Theme.of(context).errorColor ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    Icon(Icons.edit ,size: 20, color: Theme.of(context).colorScheme.background,) ,
                    Text('Edit' , style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background
                    ),)
                  ],),));
  }

  Widget _backButton(BuildContext context) {
    return Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      size:20 ,
                      color: Theme.of(context).disabledColor,
                    ),
                    Text('Back' , style: Theme.of(context).textTheme.displayMedium,)
                  ],
                );
  }
}
