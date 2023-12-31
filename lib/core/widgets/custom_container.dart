import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key ,
    this.borderRadius ,
    this.shape ,
    this.margin ,
    this.padding,
    this.border ,
    required this.child ,
     this.width ,
    this.height,
    this.gradient ,
    this.color ,
    this.boxShadow,
  this.boxConstraints
  }) : super(key: key);
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;
  final Widget child;
  final BoxBorder? border;
  final BoxShape? shape;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxConstraints? boxConstraints;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      constraints: boxConstraints,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        border: border,
        color: color,
        gradient: gradient,
        shape: shape ?? BoxShape.rectangle
      ),
      child: child,
    );
  }
}
