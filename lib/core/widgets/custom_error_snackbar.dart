import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_image_network.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/main.dart';

class CustomErrorSnackBar extends StatefulWidget {
   CustomErrorSnackBar({Key? key , required this.messageType , required this.message , this.svgSource, required this.closeSnackBar,required this.duration }) : super(key: key);
  final MessageType messageType;
  final String message;
  final String? svgSource;

  Function() closeSnackBar;
  final int duration;

  @override
  State<CustomErrorSnackBar> createState() => _CustomErrorSnackBarState();
}

class _CustomErrorSnackBarState extends State<CustomErrorSnackBar>with SingleTickerProviderStateMixin {
  String getTitle(MessageType messageType){
    switch(messageType){
      case MessageType.successful:
        return "Successful";
      case MessageType.error:
        return "Error";
      case MessageType.warning:
        return "Warning";
      case MessageType.information:
        return "Information";
    }
  }

  Widget getIcon(MessageType messageType){
    switch(messageType){
      case MessageType.successful:
        return  CustomImageNetwork(url: null , imageSvgPath: AppImages.successfulIcon,imageHeight: 47.r,imageWidth: 47.r,imageSvgSource: widget.svgSource,);
      case MessageType.error:
        return  CustomImageNetwork(url: null , imageSvgPath: AppImages.errorIcon,imageHeight: 47.r,imageWidth: 47.r,imageSvgSource: widget.svgSource);
      case MessageType.warning:
        return  CustomImageNetwork(url: null , imageSvgPath: AppImages.warningIcon,imageHeight: 47.r,imageWidth: 47.r,imageSvgSource: widget.svgSource);
      case MessageType.information:
        return  CustomImageNetwork(url: null , imageSvgPath: AppImages.informationIcon,imageHeight: 47.r,imageWidth: 47.r,imageSvgSource: widget.svgSource);
    }
  }

  Color getColor(MessageType messageType,BuildContext context){
    switch(messageType){
      case MessageType.successful:
        return  Theme.of(context).brightness == Brightness.light ? AppColors.successfulColor : AppColors.successfulColorDark;
      case MessageType.error:
        return  Theme.of(context).brightness == Brightness.light ? AppColors.errorColor : AppColors.errorColorDark;
      case MessageType.warning:
        return  Theme.of(context).brightness == Brightness.light ? AppColors.warningColor : AppColors.warningColorDark;
      case MessageType.information:
        return  Theme.of(context).brightness == Brightness.light ? AppColors.informationColor : AppColors.informationColorDark;
    }
  }

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 500),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end:  const Offset(0.0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
        reverseCurve: Curves.easeIn
      ),
    );
    animate();
    closeAnimation();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animate() {
    _controller.reset();
    _controller.forward();
  }


  void closeAnimation()async{
    await Future.delayed( Duration(seconds: widget.duration));

    _controller.reverse().then((value){
      widget.closeSnackBar();
    });
  }


  @override
  Widget build(BuildContext context) {
    return  SlideTransition(

      position: _animation,
      child: Material(
        color: Colors.transparent,
        child: Container(

          height: 75.h,

          decoration: BoxDecoration(
            boxShadow: [
              Theme.of(context).brightness == Brightness.light ? AppColors.boxShadowMenu : AppColors.boxShadowMenuDark,


            ],
          ),
          child: Stack(
            children: [
              Container(

                // height: 65.h,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  // border: Border(
                  //
                  //   bottom: BorderSide(width: 2, color: Colors.lightBlue.shade900,),
                  // ),
                  boxShadow: [

                    BoxShadow(
                        color: getColor(widget.messageType,context).withOpacity(0.1),
                        spreadRadius: 0.1,
                        offset: const Offset(0, 1)),
                    // Theme.of(context).brightness == Brightness.light ? AppColors.boxShadowMenu : AppColors.boxShadowMenuDark,
                  ],
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),

                    child: BackdropFilter(

                      filter: ImageFilter.blur(
                        sigmaX: 4.0,
                        sigmaY: 4.0,
                      ),
                      child: Material(
                        type: MaterialType.transparency,

                        child: Container(
                          // alignment: Alignment.center,
                          width: 370.w,
                          decoration: BoxDecoration(
                            border: Border(

                              bottom: BorderSide(width: 4, color: getColor(widget.messageType,context),),
                            ),
                            color: Theme.of(context).brightness == Brightness.light ? Colors.white.withOpacity(0.6) : AppColors.whiteDark.withOpacity(0.6),
                          ),



                          //    height: 65.h,

                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 12.h),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  getIcon(widget.messageType),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [


                                        SizedBox(
                                          width:289.w,
                                          child: CustomText(text:getTitle(widget.messageType),
                                            textStyle: Theme.of(context).textTheme.titleSmall ,
                                            textFontWight: TextFontWight.medium,
                                            // textColor: Theme.of(context).brightness == Brightness.light ? AppColors.active : AppColors.activeDark,
                                            //  textColor: Theme.of(context).primaryColor,
                                          ),
                                        ),

                                        SizedBox(
                                          width: 289.w,
                                          child: CustomText(text: widget.message,
                                            textStyle: Theme.of(context).textTheme.labelSmall ,
                                            textFontWight: TextFontWight.regular,

                                            textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary3 : AppColors.secondary3Dark,
                                            //    textColor: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   top: 62.h,
              //   child: CustomContainer(
              //     width: 370.w,
              //     height: 4,
              //     // gradient: LinearGradient(
              //     //   begin: Alignment.topCenter,
              //     //   end: Alignment.bottomCenter,
              //     //   colors: [
              //     //     Colors.transparent,
              //     //     Theme.of(context).colorScheme.primary,
              //     //   ]
              //     // ),
              //
              //     boxShadow: [
              //       Theme.of(context).brightness == Brightness.light ? AppColors.boxShadowMenu : AppColors.boxShadowMenuDark,
              //       BoxShadow(
              //           color: Theme.of(context).colorScheme.primary,
              //           spreadRadius: 0.1,
              //           offset: const Offset(0, 4))
              //     ],
              //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.r),bottomLeft: Radius.circular(8.r)),
              //     child: const SizedBox(),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );



  }
}
