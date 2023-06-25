import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/custom_toggle_odometer_type.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';

class OdometerInputTitle extends StatefulWidget {
   OdometerInputTitle({Key? key  , required this.onChangeOdometerType , required this.odometerFromController , required this.odometerToController}) : super(key: key);
   final TextEditingController odometerFromController;
   final TextEditingController odometerToController;

  Function(OdometerType odometerType) onChangeOdometerType;

  @override
  State<OdometerInputTitle> createState() => _OdometerInputTitleState();
}

class _OdometerInputTitleState extends State<OdometerInputTitle> {
   OdometerType odometerType = OdometerType.km;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 35.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Odometer", textStyle: Theme
                .of(context)
                .textTheme
                .labelLarge, textFontWight: TextFontWight.bold,
            ),
            CustomToggleOdometerType(
              odometerType: odometerType,
              onChange: (OdometerType odometerType){
                widget.onChangeOdometerType(odometerType);
                this.odometerType = odometerType;
                setState(() {

                });
              },
            )

          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            SizedBox(
              width: 172.w,
              child: TextFieldWithBack(
                controller: widget.odometerFromController,
                textInputType: TextInputType.number,
                prefixText: "From:",
                suffixText: CustomText(
                  text:odometerType == OdometerType.km ? "KM" : "Mile",
                  textStyle: Theme.of(context).textTheme.labelSmall ,
                  textFontWight: TextFontWight.regular,
                  textColor: Theme.of(context).brightness == Brightness.light ?AppColors.secondary2 :AppColors.secondary2Dark,
                ),
                maxLength: 7,
                hint: "2321425  ${odometerType == OdometerType.km ? "KM" : "Mile"}",
              ),
            ),
            SizedBox( width: 14.w),
            SizedBox(
              width: 172.w,
              child: TextFieldWithBack(
                controller: widget.odometerToController,
                textInputType: TextInputType.number,
                prefixText: "To :",
                maxLength: 7,
                suffixText: CustomText(
                  text:odometerType == OdometerType.km ? "KM" : "Mile",
                  textStyle: Theme.of(context).textTheme.labelSmall ,
                  textFontWight: TextFontWight.regular,
                  textColor: Theme.of(context).brightness == Brightness.light ?AppColors.secondary2 :AppColors.secondary2Dark,
                ),
                hint: "2321425  ${odometerType == OdometerType.km ? "KM" : "Mile"}",

              ),
            ),
          ],
        )

      ],
    );
  }
}
