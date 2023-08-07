import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/icon_gradient.dart';
import 'package:new_panel/main.dart';

class CustomExpansion extends StatefulWidget {
  const CustomExpansion({Key? key,

    required this.title,
    required this.contentExpansion,
    required this.iconSvgPath,
    this.initializeExpanded,
    this.subTitle

  }) : super(key: key);

  final Widget contentExpansion;
  final String iconSvgPath;
  final String title;
  final String? subTitle;
  final bool? initializeExpanded;


  @override
  State<CustomExpansion> createState() => _CustomExpansionState();
}

class _CustomExpansionState extends State<CustomExpansion> {
  late ExpandedTileController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ExpandedTileController(isExpanded:widget.initializeExpanded ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 15.h),
      child: CustomContainer(
        boxShadow: [
          Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow : AppColors.boxShadowDark
        ],
        color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
        width: 358.w,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        child:
        ExpandedTile(
          theme:  ExpandedTileThemeData(
            headerColor: Colors.transparent,
            headerRadius: 0,
            headerPadding: EdgeInsets.only(left: 10.w, right: 10.w , top: 15.h , bottom: 9.h),
            // headerPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 12.h),
            headerSplashColor: Colors.transparent,
            contentBackgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.only(left: 10.w , right: 10.w ,bottom: 15.h),
            //  contentRadius: 12.0,

          ),
          trailing: IconGradient(
            icon: Icons.keyboard_arrow_down_outlined,
            iconSize: 24.r,
          ),
          trailingRotation: 180,
          controller: _controller,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomContainer(
                  height: 35.r,
                  width: 35.r,
                  color: Theme.of(context).brightness == Brightness.light ?AppColors.primary3 :AppColors.primary3Dark,
                  shape: BoxShape.circle,
                  padding: EdgeInsets.all(7.r),
                  child: SvgPicture.asset(widget.iconSvgPath ,)
              ),

              SizedBox(
                width: 28.w,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: widget.title, textStyle: Theme.of(context).textTheme.labelSmall ,
                    textFontWight: TextFontWight.semiBold,
                  ),
                 // if(widget.subTitle != null)
                   CustomText(text: "Click for show more Detail", textStyle: Theme.of(context).textTheme.displayLarge ,
                     textFontWight: TextFontWight.regular,
                     textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary3 : AppColors.secondary3Dark,
                   ),
                ],
              )

            ],
          ),


          content: widget.contentExpansion,
          onTap: () {
            logger.i("tapped on Expansion widget");
          },
          onLongTap: () {
            logger.i("long tapped on Expansion widget");
          },
        ),
      ),
    );
//       ExpansionTileCard(
//         key: widget.expansionTileCardStateKey,
//         baseColor: Colors.transparent,
//         expandedColor: Colors.transparent,
//         elevation: 0,
//         shadowColor: Colors.transparent,
//         //expandedTextColor: Colors.red,
//         contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
//
//         //leading: const CircleAvatar(child: Text('A')),
//         title: Row(
//           children: [
//             CustomContainer(
//                 height: 35.r,
//                 width: 35.r,
//                 // color: Theme.of(context).brightness == Brightness.light ?AppColors.primary3 :AppColors.primary3Dark,
//                 shape: BoxShape.circle,
//                 child: IconGradient(
//                   icon: Icons.car_crash_outlined,
//                   iconSize: 24.r,
//
//                 )
//             ),
//
//           ],
//         ),
//
//       //  subtitle: const Text('I expand!'),
//         children: <Widget>[
//           // const Divider(
//           //   thickness: 1.0,
//           //   height: 1.0,
//           // ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 8.0,
//               ),
//               child: Text(
//                 """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.
//
// Use me any time you think your app could benefit from being just a bit more Material.
//
// These buttons control the next card down!""",
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyMedium!
//                     .copyWith(fontSize: 16),
//               ),
//             ),
//           ),
//
//         ],
//       ),
    // );
  }
}
