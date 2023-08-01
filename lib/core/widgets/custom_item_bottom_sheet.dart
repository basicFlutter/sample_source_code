import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:page_transition/page_transition.dart';

class CustomItemBottomSheet extends StatelessWidget {
  const CustomItemBottomSheet({Key? key , required this.title ,  this.onTap ,  this.destinationPage}) : super(key: key);
  final String title;
  final GestureTapCallback? onTap;
  final Widget? destinationPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap != null){
          onTap!();
        }else if(destinationPage != null){
          Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 200),
                child:   destinationPage!
            ),
          );
        }
      },
      child: CustomContainer(
        width: 338.w,
          height: 46.h,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: title,
                textStyle: Theme.of(context).textTheme.labelSmall ,
                textFontWight: TextFontWight.regular,
              ),
              Icon(Icons.arrow_forward_ios , color: Theme.of(context).primaryColor,size: 12.r,)
            ],

          )
      ),
    );
  }
}
