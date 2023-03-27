import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/widgets/searchbar_widget.dart';

import '../constants/app_images.dart';

class CustomBody extends StatelessWidget {
  final TextEditingController searchbarController;

  final Widget body;

  const CustomBody(
      {Key? key, required this.searchbarController, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _topOptions(context),
            SizedBox(
              height: 10.h,
            ),
            SearchbarWidget(
              searchbarController: searchbarController,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(child: body)
          ],
        ),
      ),
    );
  }

  Widget _topOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppImages.menu,
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(AppImages.ring,
              height: 40,
              width: 40,),
          ],
        ),
        SvgPicture.asset(AppImages.lorem),
        Row(
          children: [
            SvgPicture.asset(AppImages.add,
              height: 40,
              width: 40,),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.asset(
                      AppImages.profileTest,
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    )),
              ),
            )
          ],
        )
      ],
    );
  }
}
