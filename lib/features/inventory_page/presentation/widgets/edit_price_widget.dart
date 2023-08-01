import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/extenstions/app_extension.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_date_picker.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/title_input.dart';
import 'package:new_panel/main.dart';

class EditPriceWidget extends StatefulWidget {
  const EditPriceWidget({Key? key ,required this.price ,required this.specialEndDate,required this.specialPrice,required this.specialStartDate}) : super(key: key);
  final String? price;
  final String? specialPrice;
  final String? specialStartDate;
  final String? specialEndDate;

  @override
  State<EditPriceWidget> createState() => _EditPriceWidgetState();
}

class _EditPriceWidgetState extends State<EditPriceWidget> {
  TextEditingController priceController = TextEditingController();
  TextEditingController specialPriceController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    priceController.text = widget.price?.addSeparator??"";
    specialPriceController.text = widget.specialPrice?.addSeparator??"";
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 402.h,
      width: 290.w,
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      // color: Colors.red,
      child: Column(
        children: [

          TitleInput(
            title: "Price",
            child: TextFieldWithBack(
              controller: priceController,
              hasSeparator: true,
              textInputType: TextInputType.number,

            ),
          ),
          TitleInput(
            title: "Special Price",
            child: TextFieldWithBack(
              controller: specialPriceController,
              hasSeparator: true,
              textInputType: TextInputType.number,

            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Start Date',
                textStyle: Theme.of(context).textTheme.displayLarge,
                textFontWight: TextFontWight.medium,

              ),
              SizedBox(
                width: 20.w,
              ),
              SizedBox(
                width: 167.w,
                height: 45.w,
                child: CustomDatePicker(

                isRequired: false,
                showHintDate: true,
                initDate: widget.specialStartDate,
                onSelectedDate: (startDate){

                  logger.w("start date is  $startDate");

                }),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'End Date',
                textStyle: Theme.of(context).textTheme.displayLarge,
                textFontWight: TextFontWight.medium,

              ),
              SizedBox(
                width: 20.w,
              ),
              SizedBox(
                width: 167.w,
                height: 45.w,
                child: CustomDatePicker(
                 showHintDate: true,
                isRequired: false,
                initDate: widget.specialEndDate,
                onSelectedDate: (endDate){
                  logger.w("end date is  $endDate");
                }),
              )
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            width: 290.w,
            height: 1.h,
            color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive : AppColors.deActiveDark,
          ),

          SizedBox(
            height: 15.h,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundCornerButton(
                onTap: (){

                  Navigator.of(context).pop();

              },
                  width: 121.w,
                  height: 46.h,
                  title: "Cancel",
                  isDeActive: true,
              ),

              RoundCornerButton(
                  onTap: (){

              },
                  width: 121.w,
                  height: 46.h,
                  title: "Save",
              ),
            ],
          )




        ],
      ),
    );
  }
}
