import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/models/history_model.dart';
import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/core/widgets/custom_card_color.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/custome_expansion.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/manager/vehicle_detail_bloc.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/detail_widget.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/column_title.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/history_item.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/item_expansion_text.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/item_purchasesPrice.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/main_detial_widget.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/slider_detail.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/title_widget.dart';

class VehicleDetailPage extends StatelessWidget {
  VehicleDetailPage({Key? key, required this.id}) : super(key: key);
  final int id;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VehicleDetailBloc>(
      create: (context) => VehicleDetailBloc(getImageSliderUseCase: locator())..add(GetInventoryImages(vehicleId: id)),
      child: CustomBody(
          searchbarController: searchController,
          appBarCustom: const AppBarCustom(),
          body:  Expanded(

            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),


              child: Column(
                children: [
                  SliderDetail(),
                  SizedBox(
                    height: 25.h,
                  ),
                  TitleWidget(),
                  SizedBox(
                    height: 18.h,
                  ),
                  RoundCornerButton(
                    onTap: (){},
                    width: 358.w,
                    height: 37.h,
                    title: "Edit",
                    radius: 100.r,
                    showUnderLineShadow: true,
                    backGroundColor: Theme.of(context).brightness == Brightness.light ? AppColors.primary3 : AppColors.primary3Dark,
                    textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary : AppColors.secondary3Dark,
                    textFontWight: TextFontWight.regular,
                    svgIconPath: Theme.of(context).brightness == Brightness.light ? AppImages.editIconGradient : AppImages.editIconGradientDark,
                  ),

                  SizedBox(
                    height: 25.h,
                  ),
                  MainDetailWidget(),

                  SizedBox(
                    height: 25.h,
                  ),
                  CustomCardColor(
                    iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.gasGageIcon : AppImages.gasGageIconDark,
                    title: "HWY FUEL :",
                    value: "9.0",
                    gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientGreen : AppColors.gradientGreenDark,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomCardColor(
                    iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.gasStationIcon : AppImages.gasStationIconDark,
                    title: "CITY FUEL :",
                    value: "12.2",
                    gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientPink : AppColors.gradientPinkDark,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomExpansion(
                      title: "Details",
                      subTitle: "Click for show more Detail",
                      contentExpansion: const DetailWidget(),
                      iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.detailIcon : AppImages.detailIconDark
                  ),

                  CustomExpansion(
                      title: "Options",
                      contentExpansion:
                      const ItemExpansionText(
                        value: "Automatic Headlight - Backup Camera - Blind spot monitoring - Bluetooth - CD Player - Center Arm Rest - Climate Control - Cloth Interior - Cruise Control Cup Holder - DVD Player - Daytime Running Lights - Digital Clock - Disability Equipped - Driver Power Seats - Dual Air Conditioning - Dual impact Airbags -Entertainment System - Folding Rear Seat",
                      ),
                      iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.optionIcon : AppImages.optionIconDark
                  ),

                  CustomExpansion(
                      title: "Comment",
                      contentExpansion:
                      const ItemExpansionText(
                        value: "Automatic Headlight - Backup Camera - Blind spot monitoring - Bluetooth - CD Player - Center Arm Rest - Climate Control - Cloth Interior - Cruise Control Cup Holder - DVD Player - Daytime Running Lights - Digital Clock - Disability Equipped - Driver Power Seats - Dual Air Conditioning - Dual impact Airbags -Entertainment System - Folding Rear Seat",
                      ),
                      iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.commentIcon : AppImages.commentIconDark
                  ),

                  CustomExpansion(
                      title: "Warranty",
                      contentExpansion:
                      const ItemExpansionText(
                        value: "Warranty available up to 48 months.",
                      ),
                      iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.securityIcon : AppImages.securityIconDark
                  ),

                  CustomExpansion(
                      title: "Hyper Link",
                      contentExpansion:
                      const ColumnTitle(
                        title: "Carfax Link:",
                        value: "www.google.com",
                      ),
                      iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.fileIcon : AppImages.fileIcon
                  ),

                  CustomExpansion(
                      title: "Note",
                      contentExpansion:
                      const ItemExpansionText(
                        value: "Warranty available up to 48 months.",
                      ),
                      iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.noteIcon : AppImages.noteIconDark
                  ),

                  CustomExpansion(
                      title: "Purchase Information",
                      contentExpansion: const ItemPurchasesPrice(),
                      iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.costIcon : AppImages.costIconDark
                  ),

                  CustomExpansion(
                      title: "History",
                      contentExpansion:HistoryItem(
                        historyList: [
                          HistoryModel(date: "February 4, 2023", value: "Vehicle was entered into stock"),
                          HistoryModel(date: "February 4, 2023", value: "Vehicle was entered into stock"),
                          HistoryModel(date: "February 4, 2023", value: "Vehicle was entered into stock"),
                        ],
                      ),
                      iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.costIcon : AppImages.costIconDark
                  ),


                  SizedBox(
                    height: 100.h,
                  ),

                ],

              ),
            ),
          )
      ),
    );
  }
}
