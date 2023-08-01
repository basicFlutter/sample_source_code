import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/gradeint_text.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/edit_price_widget.dart';
import 'package:new_panel/main.dart';



class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key , required this.price , required this.specialPrice , this.isEditable}) : super(key: key);
  final String? price;
  final String? specialPrice;
  final bool? isEditable ;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // showDialog(
        //   context: context,
        //   builder: (ctx) => EditPriceWidget()
        // );
        if(isEditable ?? false){
          showDialog(context: context, builder: (BuildContext context) {
            return   AlertDialog(
              contentPadding: EdgeInsets.symmetric(vertical: 15.h , horizontal: 15.w),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r))
              ),
              content: EditPriceWidget(
                specialPrice: specialPrice,
                price: price,
                specialEndDate: null,
                specialStartDate: null,


              ),
            );
          });
        }

      },
      child: Padding(
        padding:  EdgeInsets.only(right: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                    visible: isEditable ??true,
                    child: SvgPicture.asset("assets/images/edit_icon.svg")),
                SizedBox(width: (isEditable ??true) ? 5.34.w :0),
                GradientText(
                  text: specialPrice?? price??"0",
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  textFontWight: TextFontWight.bold,
                  addSeparator: true,
                  dollarSign: true,
                  gradient:  Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark
                ),
              ],
            ),
               SizedBox(
                   height:3.5.h
               ),

            (specialPrice != null && specialPrice != "0" && price != "0") ?
            CustomText(text: price??"0",
              textStyle: Theme.of(context).textTheme.bodyMedium,
              textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary4 : AppColors.secondary4Dark,
              textFontWight: TextFontWight.bold,
              dollarSign: true,
              addSeparator: true,
              specialPrice: true,
            ):
            const SizedBox()


          ],
        ),
      ),
    );
  }
}
