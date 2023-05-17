import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_images.dart';

class SearchInventory extends StatefulWidget {
  const SearchInventory({Key? key , required this.onTapPrefixIcon, required this.onTapSuffixIcon , required this.inventorySearchController}) : super(key: key);
  final GestureTapCallback onTapSuffixIcon;
  final GestureTapCallback onTapPrefixIcon;
  final TextEditingController inventorySearchController;
  @override
  State<SearchInventory> createState() => _SearchInventoryState();
}

class _SearchInventoryState extends State<SearchInventory> {
  bool isSearchMode = false;
  @override
  Widget build(BuildContext context) {
    return isSearchMode ? _searchField(context) : _searchButton();
  }

  Widget _searchButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSearchMode = !isSearchMode;
        });
      },
      child: SvgPicture.asset(
        AppImages.circularButtonBack,
        width: 24.h,
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Expanded(
      child: Container(
        height: 24.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.tertiary,
            Theme.of(context).colorScheme.primary
          ]),
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Container(
          height: 24.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              color: Theme.of(context).colorScheme.background),
          child: TextFormField(
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium,
            controller: widget.inventorySearchController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {

                    widget.onTapSuffixIcon();
                    widget.inventorySearchController.clear();
                    isSearchMode = false;
                  });
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: 9.w),
                  child: SvgPicture.asset(AppImages.closeIcon , color: Theme.of(context).colorScheme.onBackground,)
                ),


              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 24.w, top: 1.h, bottom: 1.h),
                child: GestureDetector(
                  onTap: () {
                    widget.onTapPrefixIcon();
                  },
                  child:SvgPicture.asset(
                    AppImages.circularButtonBack,
                    width: 24.h,
                  ),
                ),
              ),

              border: InputBorder.none,
              enabledBorder:InputBorder.none
            ),
          ),
        ),
      ),
    );
  }
}
