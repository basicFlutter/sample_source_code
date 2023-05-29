import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/widgets/circular_button.dart';


class SearchInventory extends StatefulWidget {
  TextEditingController searchbarController ;
  String? fieldHint ;

  final GestureTapCallback onTapSuffix;




  SearchInventory({Key? key , required this.searchbarController , this.fieldHint , required this.onTapSuffix}) : super(key: key);

  @override
  State<SearchInventory> createState() => _SearchbarInventory();
}

class _SearchbarInventory extends State<SearchInventory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                  height: 38.h ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(19.r)),
                    boxShadow: [
                     Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow : AppColors.boxShadowDark
                    ],
                  ),
                  // width: 358.w,
                  child: TextFormField(
                    controller : widget.searchbarController ,
                    decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide( width: 0,
                            style: BorderStyle.none,),
                          borderRadius: BorderRadius.circular(19.0.r),
                        ),

                        // contentPadding:  EdgeInsets.symmetric(vertical: 8.h , horizontal: 2.w) ,
                        suffixIcon:  Padding(
                          padding:  EdgeInsets.only(right: 2.w),
                          child: CircularButton(

                              onTap: widget.onTapSuffix,
                              radius: 34.r,
                             // padding: EdgeInsets.all(7.r),
                              child: Icon(
                                Icons.close,
                                color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                              ),
                              // SvgPicture.asset("assets/images/new_filter_icon.svg",
                              //   color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                              // )
                          ),
                        ),

                        suffixIconConstraints: BoxConstraints(maxHeight: 34.r),
                        // Icon(Icons.search , color: Colors.red,),
                        hintText:widget.fieldHint ??  'Search All',
                        hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive : AppColors.deActiveDark
                        ),
                        filled: true ,
                        fillColor: Theme.of(context).brightness == Brightness.light ? AppColors.white :AppColors.whiteDark
                    ),
                  )))  ,
          // _filterButton(context)
        ],),
    );
  }

}

