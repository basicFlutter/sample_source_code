import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:new_panel/core/widgets/custom_range_slider.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/title_input.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderPrice extends StatefulWidget {
  const SliderPrice({Key? key}) : super(key: key);

  @override
  State<SliderPrice> createState() => _SliderPriceState();
}

class _SliderPriceState extends State<SliderPrice> {
  RangeValues rangeValues =const RangeValues(1000,6000000);
  TextEditingController priceFromController = TextEditingController();
  TextEditingController priceToController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Price",
          textStyle: Theme.of(context).textTheme.labelLarge ,
          textFontWight: TextFontWight.semiBold,
          letterSpace: 0.05,
        ),
        SizedBox( height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "Min", textStyle: Theme.of(context).textTheme.displaySmall , textFontWight: TextFontWight.regular,),
            CustomText(text: "Max", textStyle: Theme.of(context).textTheme.displaySmall , textFontWight: TextFontWight.regular,)

          ],
        ),
        CustomRangeSlider(
          rangeValues: rangeValues,
          min: 0,
          max: 9999999,
          onChange: (value){
            priceFromController.text = NumberFormat.decimalPattern().format(value.start.toInt());
            priceToController.text = NumberFormat.decimalPattern().format(value.end.toInt());
          },
        ),
        SizedBox( height: 25.h),
         Row(
           children: [
             SizedBox(
               width: 172.w,
               child: TextFieldWithBack(
                 controller: priceFromController,
                 textInputType: TextInputType.number,
                 prefixText: "From:",
                 hasSeparator: true,
                 maxLength: 9,
                 hint: "12,340,23",
               ),
             ),
             SizedBox( width: 14.w),
             SizedBox(
               width: 172.w,
               child: TextFieldWithBack(
                 controller: priceToController,
                 textInputType: TextInputType.number,
                 prefixText: "To :",
                 hasSeparator: true,
                 maxLength: 9,
                 hint: "12,340,23",

               ),
             ),
           ],
         ),
      ],
    );
  }
}
