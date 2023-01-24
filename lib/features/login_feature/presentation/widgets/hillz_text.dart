import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HillzLogo extends StatelessWidget {
  const HillzLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 269.r,
        height: 269.r,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.77)
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 40.6.h,
                  ),
                  SvgPicture.asset(
                    "assets/images/Logo.svg",
                    width: 102.96,
                    height: 102.23,
                  ),
                  SizedBox(
                    height: 5.8.h,
                  ),
                  Text("HillzDealer" , style: Theme.of(context).textTheme.labelLarge,),
                  Text("Driven by Future," , style: Theme.of(context).textTheme.labelSmall,),
                  Text("Run Faster, Cost Less" , style: Theme.of(context).textTheme.labelSmall,),

                ],
              ),
            ]
        ),


      );


      Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 5.8.h,
        ),
        Text("HillzDealer" , style: Theme.of(context).textTheme.labelLarge,),
        Text("Driven by Future," , style: Theme.of(context).textTheme.labelSmall,),
        Text("Run Faster, Cost Less" , style: Theme.of(context).textTheme.labelSmall,),
      ],
    );
  }
}
