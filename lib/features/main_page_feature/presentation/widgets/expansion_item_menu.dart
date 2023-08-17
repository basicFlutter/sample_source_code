import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/custom_submenu.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/drawerItem.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:new_panel/core/models/submenu_model.dart';

class ExpansionItemMenu extends StatefulWidget {
  const ExpansionItemMenu({Key? key , required this.children , required this.title , required this.iconSvgPath , required this.onTap}) : super(key: key);
  final List<SubmenuModel> children;
  final String iconSvgPath;
  final String title;
  final Function(SubmenuModel) onTap;



  @override
  State<ExpansionItemMenu> createState() => _ExpansionItemMenuState();
}

class _ExpansionItemMenuState extends State<ExpansionItemMenu> {
  late ExpandedTileController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ExpandedTileController(isExpanded: false);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6.r)),
        child: ExpandedTile(
          theme:  ExpandedTileThemeData(
            headerColor: Colors.transparent,
            headerRadius: 0,
            headerPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            leadingPadding: EdgeInsets.zero,
            trailingPadding: EdgeInsets.zero,
            headerSplashColor: Colors.transparent,
            contentBackgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.only(left: 20.w , right: 10.w ,bottom: 15.h),
          ),
          trailingRotation: 180,
          trailing: Icon(
              Icons.keyboard_arrow_down_outlined,
            color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
          ),


          controller: _controller,
          title:     DrawerItem(
                 imageSvgPath: widget.iconSvgPath,
                 title: widget.title,
              ),


          content: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.children.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                widget.onTap(widget.children[index]);
                },
                child: CustomSubmenu(
                  subtitle: widget.children[index].title ,
                  index: index,
                  itemLength: widget.children.length,
                ),
              );
            },

          ),

          onTap: () {
          },
          onLongTap: () {

          },
        ),
      ),
    );
  }
}
