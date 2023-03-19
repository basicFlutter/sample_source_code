// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:new_panel/core/constants/app_dimensions.dart';
// import 'package:new_panel/core/widgets/custom_space.dart';
//
// import '../constants/app_colors.dart';
// import '../constants/app_enum.dart';
// import '../constants/app_images.dart';
// import '../exceptions/error_model.dart';
//
// class CustomAlertDialog extends StatelessWidget {
//   ErrorModel alert;
//
//   CustomAlertDialog({Key? key, required this.alert}) : super(key: key);
//   Color alertColor = AppColors.warningColor;
//   String alertImageUrl = '';
//
//   String title = '';
//
//   @override
//   Widget build(BuildContext context) {
//     if (alert.alertType == 'ERROR') {
//       alertColor = Theme
//           .of(context)
//           .colorScheme
//           .error;
//       alertImageUrl = AppImages.errorSvg;
//       title = 'Error';
//     } else if (alert.alertType == 'INFO') {
//       alertColor = AppColors.infoColor;
//       alertImageUrl = AppImages.infoSvg;
//       title = 'Info';
//     } else if (alert.alertType == 'SUCCESS') {
//       alertColor = AppColors.successColor;
//       alertImageUrl = AppImages.successSvg;
//       title = 'Success';
//     } else if (alert.alertType == 'WARNING') {
//       alertColor = AppColors.warningColor;
//       alertImageUrl = AppImages.warningSvg;
//       title = 'Warning';
//     }
//
//     return Dialog(
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       shape: RoundedRectangleBorder(
//           borderRadius:
//           BorderRadius.all(Radius.circular(AppDimensions.buttonRadius))),
//       child: Container(
//         // height: 200.h,
//         decoration: const BoxDecoration(color: Colors.transparent),
//         margin:  EdgeInsets.only(top: 8.h),
//
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Container(
//               width: 243.w,
//               // height: 153.h,
//               padding:  EdgeInsets.only(
//                 top: 5.0.h,
//               ),
//               margin:  EdgeInsets.only(top: 18.0.h, right: 8.0.w),
//               decoration: BoxDecoration(
//                   color: alertColor,
//                   borderRadius: BorderRadius.all(
//                       Radius.circular(AppDimensions.buttonRadius))),
//               child: _mainCard(context),
//             ),
//             Positioned(
//                 top: 0.h,
//                 child: SvgPicture.asset(
//                   alertImageUrl,
//                   fit: BoxFit.fitHeight,
//
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _mainCard(BuildContext context) {
//     return _container(context);
//   }
//
//   Widget _container(BuildContext context) {
//     return Container(
//       width: 243.w,
//       // height: 133.h,
//       decoration: BoxDecoration(
//           borderRadius:
//           BorderRadius.all(Radius.circular(AppDimensions.buttonRadius)),
//           color: Theme
//               .of(context)
//               .colorScheme
//               .background),
//
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CustomVerticalSpace(
//             space: 23.h,
//           ),
//           _title(context),
//           CustomVerticalSpace(
//             space: 5.h,
//           ),
//           _alertText(context),
//           TextButton(onPressed: () {
//             Navigator.of(context).pop() ;
//           }, child: Text('Close', style: Theme
//               .of(context)
//               .textTheme.titleMedium!.copyWith(
//             color: Theme.of(context).disabledColor
//           ),))
//         ],
//       ),
//     );
//   }
//
//   Widget _alertText(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 13.w),
//       child: Text(
//         alert.message ?? '',
//         textAlign: TextAlign.center,
//         style: Theme
//             .of(context)
//             .textTheme
//             .headlineLarge,
//       ),
//     );
//   }
//
//   Widget _title(BuildContext context) {
//     return Text(
//       title,
//       style:
//       Theme
//           .of(context)
//           .textTheme
//           .titleLarge!
//           .copyWith(color: alertColor),
//     );
//   }
// }
