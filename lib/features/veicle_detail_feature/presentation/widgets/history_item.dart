import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/models/history_model.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({Key? key , required this.historyList}) : super(key: key);

 final List<HistoryModel>? historyList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      historyList!.map((e) {
        return SizedBox(
          height: 45.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: e.date,
                textStyle: Theme.of(context).textTheme.displayMedium ,
                textFontWight: TextFontWight.medium,
                textColor: Theme.of(context).brightness == Brightness.light ?  AppColors.secondary3 : AppColors.secondary3Dark,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                text: ". ${e.value}",
                textStyle: Theme.of(context).textTheme.labelMedium ,
                textFontWight: TextFontWight.regular,
              ),

            ],
          ),
        );

      }).toList()
    );
  }
}
