import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/custom_space.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_dotted_line_widget.dart';

class InventoryItemWidget extends StatefulWidget {
  const InventoryItemWidget({Key? key}) : super(key: key);

  @override
  State<InventoryItemWidget> createState() => _InventoryItemWidgetState();
}

class _InventoryItemWidgetState extends State<InventoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return _inventoryItem(context);
  }

  Widget _inventoryItem(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Container(
        // height: 154.h,
        width: 386.w,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimensions.buttonRadius))),
        child: Column(
          children: [_topOfCard(context), _bottomCard(context)],
        ),
      ),
    );
  }

  Widget _bottomCard(BuildContext context) {
    return Container(
      width: 386.w,
      // height: 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppDimensions.buttonRadius) , bottomRight:Radius.circular(AppDimensions.buttonRadius) ),
          color: Theme.of(context).colorScheme.secondaryContainer),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _firstRow(context),

          Padding(
            padding:  EdgeInsets.symmetric(vertical: 2.h),
            child: CustomDottedLineWidget(
              width: 364.w,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: _secondRow(),
          )
        ],
      ),
    );
  }

  Widget _secondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _cardItems(icon: Icons.sell, text: 'Sold', onTap: () {  }) ,
            _cardItems(icon: Icons.refresh , text: 'Coming Soon', onTap: () {  }) ,
            _cardItems(icon: Icons.pending, text: 'Pending', onTap: () {  }) ,
            _cardItems(icon: Icons.delete, text: 'Delete', onTap: () {  }) ,
          ],
        );
  }

  Widget _cardItems({required IconData icon , required String text , required Function() onTap }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
              children:  [
                 Icon(
                  icon,
                  size: 15,
                ),
                Text(text  ,style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),)
              ],
            ),
    );
  }

  Widget _firstRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'age:1',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
        ),
        Text(
          'stock:NV213f4',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
        ),
        Text(
          'Condition:1',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'active',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            SizedBox(
                height: 30.h,
                width: 50.w,
                child: Switch(value: true, onChanged: (value) {}))
          ],
        ),
      ],
    );
  }

  Widget _topOfCard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _cardImage(),
            SizedBox(
              width: 5.w,
            ),
            _vehicleInformation()
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _price(context),

            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        )
      ],
    );
  }

  Widget _price(BuildContext context) {
    return Padding(
            padding: EdgeInsets.only(right: 8.0.w, top: 5.h),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.edit,
                      size: 18,
                    )),
                Text(
                  '\$5,000',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                )
              ],
            ),
          );
  }

  Widget _vehicleInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 0.3.sw,
          child: Text(
            'SEDAN 2002 SUV',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
          ),
        ),
        CustomVerticalSpace(
          space: 4.h,
        ),
        Text(
          '15734 KM',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
        ),
        Text(
          'tRUUT28N7110442',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
        ),
        Text(
          'sedan',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
        ),
        Text(
          'Stock# :3333333333',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
        ),
      ],
    );
  }

  Widget _cardImage() {
    return SizedBox(
        width: 123.w,
        height: 95.h,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.buttonRadius)),
            child: Image.asset(
              AppImages.inventoryTest,
              fit: BoxFit.fill,
            )));
  }
}
