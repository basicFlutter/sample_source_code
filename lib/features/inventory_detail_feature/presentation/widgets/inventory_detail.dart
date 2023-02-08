import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/widgets/custom_divider.dart';

import '../../../../core/constants/app_images.dart';

class InventoryDetail extends StatelessWidget {
  const InventoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 37.w, left: 37.w),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_mainInfo(context), _price(context)],
          ),
          const CustomDivider(
            type: DividerType.horizontal,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _detailItem(context),
                CustomDivider(
                  type: DividerType.vertical,
                  width: 2.w,
                ),
                _detailItem(context),
                CustomDivider(
                  type: DividerType.vertical,
                  width: 2.w,
                ),
                _detailItem(context),

              ],
            ),
          ) ,

          const CustomDivider(
            type: DividerType.horizontal,
          ),

          _horizontalDetailItem(context : context ,title : 'Vin' , value :'1MEBP67D5BF617327' , imageURL: AppImages.vin),
          const CustomDivider(
            type: DividerType.horizontal,
          ),
          _horizontalDetailItem(context : context ,title : 'Body style' , value :'Sedan' , imageURL: AppImages.car),
          const CustomDivider(
            type: DividerType.horizontal,
          ),
          _horizontalDetailItem(context : context ,title : 'stock #' , value :'1MEBP67D5BF617327' , imageURL: AppImages.chart),
          const CustomDivider(
            type: DividerType.horizontal,
          ),
          _horizontalDetailItem(context : context ,title : 'Color' , value :'white' , imageURL: AppImages.color),
          const CustomDivider(
            type: DividerType.horizontal,
          ),
          _horizontalDetailItem(context : context ,title : 'Engine' , value :'8 Cylinder' , imageURL: AppImages.engine),
          const CustomDivider(
            type: DividerType.horizontal,
          ),
          _horizontalDetailItem(context : context ,title : 'City Fuel' , value :'1ME' , imageURL: AppImages.gaz),
          const CustomDivider(
            type: DividerType.horizontal,
          ),
          _horizontalDetailItem(context : context ,title : 'Hwy Fuel' , value :'1ME' , imageURL: AppImages.gaz),
          const CustomDivider(
            type: DividerType.horizontal,
          ),
          _horizontalDetailItem(context : context ,title : 'Trim' , value :'2dr Hatchback' , imageURL: AppImages.sticker),

        ],
      ),
    );
  }

  Widget _horizontalDetailItem({required BuildContext context,required String title , required String value , required String imageURL} ) {
    return Padding(
      padding:  EdgeInsets.only(top: 12.h , bottom: 12.h),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              SvgPicture.asset(imageURL),
              SizedBox(width: 4.w,),
              Text(title, style: Theme.of(context).textTheme.headlineMedium)
            ],) ,

            Text(value, style: Theme.of(context).textTheme.displayMedium,)
          ],),
    );
  }

  Widget _detailItem(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13.h ,bottom:9.h ),
      child: Column(
        children: [
          Text(
            'Fuel Type',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Gasoline Fule',
            style: Theme.of(context).textTheme.labelLarge,
          )
        ],
      ),
    );
  }

  Widget _price(BuildContext context) {
    return Column(
      children: [
        Text(
          '\$0.000',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(decoration: TextDecoration.lineThrough),
        ),
        Text(
          '\$0,000',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).primaryColor),
        )
      ],
    );
  }

  Widget _mainInfo(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        '2020 Bmw M550I',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      Text(
        '15734 KM',
        style: Theme.of(context).textTheme.displayMedium,
      )
    ]);
  }
}
