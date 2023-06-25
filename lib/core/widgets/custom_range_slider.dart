import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/gradient_track_slider_shape.dart';

class CustomRangeSlider extends StatefulWidget {
   CustomRangeSlider({Key? key , required this.rangeValues , this.width ,required this.onChange , required this.min , required this.max}) : super(key: key);
   RangeValues rangeValues;
  Function(RangeValues rangeValue) onChange;
  double min ;
  double max;
  double? width;

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
         activeTrackColor: Theme.of(context).brightness == Brightness.light ? AppColors.primary :AppColors.primaryDark,
         inactiveTrackColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary2 :AppColors.secondary2Dark,

          trackHeight: 4.h,
          thumbColor: Theme.of(context).brightness == Brightness.light ? AppColors.primary : AppColors.primaryDark,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20.r ),
          overlayShape: SliderComponentShape.noOverlay
      ),
      child: SizedBox(
        width: widget.width ?? 358.w,
        child: RangeSlider(
          min: widget.min,
          max: widget.max,


          values: widget.rangeValues,
          onChanged: (value) {
            setState(() {
              widget.rangeValues = value;
            });
            widget.onChange(value);
          },
        ),
      ),
    );
  }
}
