import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InServiceIcon extends StatelessWidget {
  const InServiceIcon({Key? key , required this.inService}) : super(key: key);
  final bool inService;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 10.r,
        height: 10.r,
        child: SvgPicture.asset(inService ? "assets/images/serviceIcon.svg" : "assets/images/checkIcon.svg"));
  }
}
