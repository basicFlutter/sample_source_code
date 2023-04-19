import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubMenu extends StatefulWidget {

  const SubMenu({Key? key}) : super(key: key);

  @override
  State<SubMenu> createState() => _SubMenuState();
}

class _SubMenuState extends State<SubMenu> {
  @override
  Widget build(BuildContext context) {
    return _subMenu(context);
  }


  Widget _subMenu(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dot(context:context ,  isSelected : false ),
              _line(context),
              _dot(context:context ,   isSelected : false ),
              _line(context),
              _dot(context:context ,   isSelected : false ),
              _line(context),
              _dot(context:context ,  isSelected : false ),
              _line(context) ,
              _dot(context: context, isSelected : true  ) ,
              _line(context) ,
              _dot(context: context, isSelected : false ) ,
              _line(context) ,
              _dot(context: context,  isSelected : false ) ,
              SizedBox(height: 30.h,)
            ],
          ),
          SizedBox(width: 8.w,) ,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _subTitle(context , 'Customer Reports' ,(){} ) ,
              _subTitle(context ,  'Add New Prospect' , (){} ) ,
              _subTitle(context ,'Quick Credit',  (){}  ) ,
              _subTitle(context ,  'Credit Reports', (){} ) ,
              _subTitle(context , 'Appointments', (){}   ) ,
              _subTitle(context ,'Send Bulk Email' ,(){} ) ,
              _subTitle(context ,'Send Bulk SMS' , (){} ) ,
            ],)
        ],
      ),
    );
  }

  Widget _subTitle(BuildContext context , String title , Function() onTap ) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 26.h),
      child: GestureDetector(
        onTap: onTap,
        child: Text(title , style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.white
        ),),
      ),
    );
  }



  Widget _line(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: Container(
        width: 1.w,
        height: 36.h,
        decoration:
        BoxDecoration(color: Theme.of(context).colorScheme.background),
      ),
    );
  }

  Widget _dot({required BuildContext context ,  required bool isSelected  }) {
    return Container(
      width: 8.w,
      height: 8.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.background),
    );
  }


}
