import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBody(
        searchbarController: searchController,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              AppBarCustom(

                title: "Filter",
                actions:  RoundCornerButton(
                  width: 60.w,
                  height: 35.h,
                  title: "Reset",

                ),

              )
            ],
          ),
        )
    );
  }
}
