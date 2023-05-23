import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/widgets/subtitle.dart';

class CustomErrorWidget extends StatefulWidget {
  final String errorText ;
  final bool isVisible;
  final String? iconSrc;
  const CustomErrorWidget({Key? key , required this.errorText , required this.isVisible , required this.iconSrc}) : super(key: key);

  @override
  State<CustomErrorWidget> createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  bool _visibleError = false;




  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isVisible  ? 1 : 0,
      duration:  Duration(milliseconds: widget.isVisible ? 10 : 500),
      onEnd: (){
        if(widget.isVisible){
          _visibleError = true;
        }else{
          _visibleError = false;
        }
        setState(() {

        });

      },
      child: Visibility(
        visible: _visibleError,
        child: Container(
          width: 380.w,
          margin: EdgeInsets.only( top: 20.h),
          constraints: BoxConstraints(
            minHeight: 51.h,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).errorColor.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(8.r))
          ),

          child: Row(children: [
            Padding(
              padding:  EdgeInsets.only(top: 13.w , bottom: 13.w,left: 16.h , right: 12.h),
              child:  widget.iconSrc != null ?  SvgPicture.string(widget.iconSrc!) : SizedBox(
                width: 20.w,
                height: 20.w,
              ),

            ),

            // Padding(
            //   padding:  EdgeInsets.only(top: 13.w , bottom: 13.w,left: 16.h , right: 12.h),
            //   child: Icon(Icons.error , color: Theme.of(context).errorColor),
            // ) ,
            Container(
              width: 316.h,
                padding: EdgeInsets.symmetric(vertical: 14.h),

                child: Subtitle(text: widget.errorText))
          ],),
        ),
      ),
    );
  }
}
