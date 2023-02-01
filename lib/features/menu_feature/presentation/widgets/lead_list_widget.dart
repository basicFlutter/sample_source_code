import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/features/menu_feature/presentation/widgets/lead_item_widget.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_images.dart';

class LeadListWidget extends StatelessWidget {
  const LeadListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _leadListWidget(context );
  }
  Widget _leadListWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LeadItemWidget() ,
            LeadItemWidget() ,
            LeadItemWidget() ,

          ],),
      ),
    );
  }
}
