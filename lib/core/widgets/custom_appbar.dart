// import 'package:flutter/material.dart';
//
// import '../constants/app_colors.dart';
// import '../constants/app_dimensions.dart';
// import '../constants/app_styles.dart';
//
// class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
//   CustomAppbar(
//       {Key? key,
//       required this.title,
//       this.action,
//       this.hasBackButton,
//       this.onBack})
//       : super(key: key);
//   String title;
//   Widget? action;
//   Function()? onBack;
//   bool? hasBackButton;
//   @override
//   State<CustomAppbar> createState() => _CustomAppbarState();
//
//   @override
//   Size get preferredSize => const Size.fromHeight(45);
// }
//
// class _CustomAppbarState extends State<CustomAppbar> {
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: _customAppbar(context));
//   }
//
//   AppBar _customAppbar(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       elevation: 0,
//       backgroundColor: Theme.of(context).backgroundColor,
//       actions: widget.action != null
//           ? [widget.action!]
//           : [
//               SizedBox(
//                 width: widget.hasBackButton ?? false ?35 : 0,
//               )
//             ],
//       leading: widget.hasBackButton ?? false ? _backButton(context) : null,
//       title: Center(
//           child: Align(
//         alignment: Alignment.center,
//         child: Text(
//           widget.title,
//           textAlign: TextAlign.center,
//           style: AppStyles.body1.copyWith(color: AppColors.titleColor),
//         ),
//       )),
//     );
//   }
//
//   Widget _backButton(BuildContext context) {
//     return IconButton(
//         onPressed: widget.onBack ??
//             () {
//               Navigator.pop(context);
//             },
//         icon: Container(
//           width: 35,
//           height: 35,
//           decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Theme.of(context).shadowColor,
//                   blurRadius: 1,
//                   offset: Offset(1, 2), // Shadow position
//                 ),
//               ],
//               borderRadius: BorderRadius.all(
//                   Radius.circular(AppDimensions.smallButtonRadius)),
//               color: Theme.of(context).scaffoldBackgroundColor),
//           child: Icon(
//             Icons.arrow_back_ios_new_outlined,
//             color: Theme.of(context).primaryColor,
//           ),
//         ));
//   }
// }
