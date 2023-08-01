import 'package:flutter/cupertino.dart';

mixin MediaQueryMixin {

  Size getScreenSize(BuildContext context){
    return MediaQuery.of(context).size;
  }

  Orientation getDeviceOrientation(BuildContext context){
    return MediaQuery.of(context).orientation;
  }





}