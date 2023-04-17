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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // leading: SizedBox(width: 1,),
        automaticallyImplyLeading: false ,
        // actions: [],
        backgroundColor: Theme.of(context).colorScheme.background,
        toolbarHeight: 120.h,
        elevation: 0,
        title:Column(children: [
        _topOptions(context),
        SizedBox(
          height: 10.h,
        ),
        SearchbarWidget(
          searchbarController: searchbarController,
        ),
      ],) ,),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric( vertical: 18.h),
          child: body,
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
              height: 40.r,
              width: 40.r,
            ),
             SizedBox(
              width: 10.w,
            ),
            SvgPicture.asset(AppImages.ring,
              height: 40.r,
              width: 40.r,
            ),
          ],
        ),
        SvgPicture.asset(AppImages.lorem),
        Row(
          children: [
            SvgPicture.asset(AppImages.add,
              height: 40.r,
              width: 40.r,),
             SizedBox(
              width: 10.w,
            ),
            Container(
              width: 55.r,
              height: 55.r,
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
                      width: 40.r,
                      height: 40.r,
                    )),
              ),
            )
          ],
        )
      ],
    );
  }
}
