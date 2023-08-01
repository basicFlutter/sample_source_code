import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/gradeint_text.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/inventory_bloc.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/button_change_status.dart';
import 'package:new_panel/main.dart';

class SelectedStateWidget extends StatelessWidget {
   SelectedStateWidget({Key? key , required this.vehicleIdListSelected , required this.onTapDoneButton}) : super(key: key);
   List<int> vehicleIdListSelected;
  final GestureTapCallback onTapDoneButton;


  @override
  Widget build(BuildContext context) {


    return CustomContainer(
      width: 358.w,
      height: 110.h,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(

            children: [
              CustomText(
                text: "${vehicleIdListSelected.length} Selected", textStyle: Theme.of(context).textTheme.titleLarge ,
                textFontWight: TextFontWight.bold,
              ),

              const Expanded(child: SizedBox()),

              InkWell(
                onTap: onTapDoneButton,
                child: GradientText(
                  text: "Done", textStyle: Theme.of(context).textTheme.labelMedium ,
                  textFontWight: TextFontWight.regular,
                  gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark,
                ),
              ),

            ],
          ),
          SizedBox(
            height: 5.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonChangeStatus(
                title: "Pending",

                onTap: (){
                  BlocProvider.of<InventoryBloc>(context).add(GetWholeInventoriesEvent());
                  logger.w("$vehicleIdListSelected pending");

                },
              ),
              ButtonChangeStatus(
                title: "Delete listing",

                onTap: (){
                  logger.w("$vehicleIdListSelected Delete");
                },
              ),
              ButtonChangeStatus(
                title: "Add template",

                onTap: (){
                  logger.w("$vehicleIdListSelected Add template");
                },
              ),
              ButtonChangeStatus(
                title: "Window sticker",

                onTap: (){
                  logger.w("$vehicleIdListSelected Window sticker");
                },
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonChangeStatus(
                title: "Appraisal",
                useLargeButton: true,

                onTap: (){

                },
              ),
              ButtonChangeStatus(
                title: "Coming soon",
                useLargeButton: true,
                onTap: (){

                },
              ),
              ButtonChangeStatus(
                title: "Mark as sold",
                useLargeButton: true,
                onTap: (){

                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}
