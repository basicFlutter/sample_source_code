import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/main.dart';


class CustomCheckBox extends StatefulWidget {
  final String? text;
  bool isChecked ;
  final Function(bool? value) onChecked ;
  final EdgeInsets? margin;
  final double? checkBoxSize;
  final double? iconSize;
  final EdgeInsets? padding;
  final bool? rectangleShape;


   CustomCheckBox({Key? key,required this.onChecked ,
     this.iconSize,
     this.padding,
     this.text ,
     required this.isChecked ,
     this.margin ,
     this.rectangleShape,
     this.checkBoxSize }) : super(key: key);

  @override
  State<CustomCheckBox> createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  void initState() {
    super.initState();
    setState(() {
      // update the state here
    });
  }

  void updateState() {
    widget.isChecked = ! widget.isChecked;
    widget.onChecked(widget.isChecked);
    setState(() {
      // update the state here
    });
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        widget.isChecked = ! widget.isChecked;
        widget.onChecked(widget.isChecked);
        setState(() {

        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: 24.r,
            height: 24.r,
            margin: widget.margin,
            duration: const Duration(milliseconds: 700),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
                gradient:widget.isChecked ? Theme.of(context).brightness == Brightness.light ? AppColors.gradientOrange : AppColors.gradientOrangeDark : null,
                shape: (widget.rectangleShape != null && widget.rectangleShape == true ) ? BoxShape.rectangle :BoxShape.circle ,
                border:widget.isChecked == false ?  Border.all(color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive : AppColors.deActiveDark) : null,
              borderRadius:(widget.rectangleShape != null && widget.rectangleShape == true ) ? BorderRadius.all(Radius.circular(5.r)) :null

            ),

            child: widget.isChecked
                ? Icon(
              Icons.check,
              color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
              size: widget.iconSize ?? 18.r,
            )
                : null,
          ),
          if(widget.text != null)
            SizedBox(
              width: 6.13.w,
            ),
          if(widget.text != null)
         CustomText(text: widget.text!, textStyle: Theme.of(context).textTheme.displayMedium)
        ],
      ),
    );
  }
}
