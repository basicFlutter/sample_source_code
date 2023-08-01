import 'dart:math';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/base_container_border_grandient.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/icon_gradient.dart';
import 'package:new_panel/main.dart';

class CustomExpansionInBottomSheet extends StatefulWidget {
   CustomExpansionInBottomSheet({Key? key,

    required this.title,


    this.initializeExpanded,
    required this.selectedTile,
    required this.onSelected,
     required this.itemListTitle

  }) : super(key: key);

  final String title;
  final String selectedTile;
  final bool? initializeExpanded;
  Function(String titleSelected) onSelected;
  final List<String> itemListTitle;



  @override
  State<CustomExpansionInBottomSheet> createState() => _CustomExpansionInBottomSheetState();
}

class _CustomExpansionInBottomSheetState extends State<CustomExpansionInBottomSheet> {
  late ExpandedTileController _controller;
  String selected = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ExpandedTileController(isExpanded:widget.initializeExpanded ?? false);
    _controller.addListener(() {
      setState(() {

      });
    });

  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 18.h),
      child: CustomContainer(
        // boxShadow: [
        //   Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow : AppColors.boxShadowDark
        // ],
        // color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
        width: 358.w,
        // color: Colors.red,
        // height: 49.h,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        child:
        ExpandedTile(
         expansionDuration: Duration.zero,

          theme:  ExpandedTileThemeData(
            headerColor: Colors.transparent,
            headerRadius: 0,
            headerPadding: EdgeInsets.only(left: 0.w, right: 5.w , top: 0.h , bottom: 9.h),
            // headerPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 12.h),
            headerSplashColor: Colors.transparent,
            contentBackgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            trailingPadding: EdgeInsets.only(right: 0.w)

            //  contentRadius: 12.0,

          ),
          trailing:

        ContainerWithBorderGradient(
            radius: 26.r,
            child: Transform.rotate(
              angle: 90 * pi / 180,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor,size: 12.r,
              ),
            ),

          ),


          trailingRotation: 180,
          controller: _controller,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [



              CustomText(text: widget.title, textStyle: Theme.of(context).textTheme.labelSmall ,
                textFontWight: _controller.isExpanded ? TextFontWight.bold:TextFontWight.regular,
              )

            ],
          ),


          content:CustomContainer(

              boxShadow: [
                Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow : AppColors.boxShadowDark,
                BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    spreadRadius: 0.1,
                    offset: const Offset(0, -2))
              ],

              color:   Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.itemListTitle.map((item) => InkWell(
                  onTap: () async{
                    if(widget.selectedTile != item){
                      widget.onSelected(item);

                      selected = item;
                      setState(() {

                      });
                      await  Future.delayed(const Duration(milliseconds: 500));
                      _controller.collapse() ;
                    }



                  },
                  child: CustomContainer(
                      height: 35.h,
                      width: 314.w,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: selected == item ?( Theme.of(context).brightness == Brightness.light ? AppColors.input : AppColors.inputDark) : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 10.w),
                            child: CustomText(
                              text: item,
                              textStyle: Theme.of(context).textTheme.labelSmall,
                              textColor: widget.selectedTile == item ? (Theme.of(context).brightness == Brightness.light ? AppColors.secondary3 : AppColors.secondary3Dark) :selected == item ? Theme.of(context).primaryColor : null,
                              textFontWight: widget.selectedTile == item ?  TextFontWight.regular :selected == item ? TextFontWight.medium : null,
                            ),
                          ),
                        ],
                      )),
                )).toList(),
              )

          ),
          //widget.contentExpansion,
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
