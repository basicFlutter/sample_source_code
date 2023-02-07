import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/custom_dotted_line_widget.dart';
import '../../../../core/widgets/custom_space.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title ;
  final void Function() onTap ;

  const CustomTitleWidget({Key? key , required this.title , required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _inventoryTitle(context );
  }



  Widget _inventoryTitle(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                _viewAllTitle(context)
              ],
            ),
          ),
          CustomVerticalSpace(
            space: 4.h,
          ),
          CustomDottedLineWidget(width:385.w ,),
        ],
      ),
    );
  }


  Widget _viewAllTitle(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Row(
        children: [
          Container(
            height: 12.h,
            width: 12.w,
            decoration: BoxDecoration(
                color:
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.circle))),
            child: Center(
                child: Icon(
                  Icons.add,
                  size: 9,
                  color: Theme.of(context).colorScheme.primary,
                )),
          ),
          SizedBox(
            width: 3.w,
          ),
          TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Text(
                'View All',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ))
        ],
      ),
    );
  }
}
