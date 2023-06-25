import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/models/drop_down_model.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/core/widgets/custom_dropdown.dart';
import 'package:new_panel/core/widgets/odometer_input_title.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/core/widgets/simpleDropDown.dart';
import 'package:new_panel/core/widgets/simple_suggestion.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/slider_price.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/title_input.dart';
import 'package:new_panel/main.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  TextEditingController searchController = TextEditingController();
  TextEditingController totalCostFromController = TextEditingController();
  TextEditingController totalCostToController = TextEditingController();
  TextEditingController yearFromController = TextEditingController();
  TextEditingController yearToController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController odometerFromController = TextEditingController();
  TextEditingController odometerToController = TextEditingController();
  String modelCharacters = '';

  FocusNode modelFocusNode = FocusNode();
  OdometerType odometerType = OdometerType.km;
  List<DropDownModel> items = [
    DropDownModel(title: "Inventory"),
    DropDownModel(title: "Coming Soon"),
    DropDownModel(title: "Active Inventory"),
    DropDownModel(title: "Pending"),
    DropDownModel(title: "Appraisal"),
    DropDownModel(title: "Delete"),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBody(
        searchbarController: searchController,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(

            children: [
              AppBarCustom(
                title: "Filter",
                height: 65.h,
                actions:  RoundCornerButton(
                  width: 60.w,
                  height: 35.h,
                  title: "Reset",
                ),
              ),

              SizedBox(
                height: 663.h,
                child: SingleChildScrollView(

                  child: Column(
                children: [
                  const SliderPrice(),
                  TitleInput(
                    title: "Total Cost",
                    child:  Row(
                      children: [
                        SizedBox(
                          width: 172.w,
                          child: TextFieldWithBack(
                            controller: totalCostFromController,
                            textInputType: TextInputType.number,
                            prefixText: "From:",
                            hasSeparator: true,
                            maxLength: 9,
                            hint: "12,340,23",
                          ),
                        ),
                        SizedBox( width: 14.w),
                        SizedBox(
                          width: 172.w,
                          child: TextFieldWithBack(
                            controller: totalCostToController,
                            textInputType: TextInputType.number,
                            prefixText: "To :",
                            hasSeparator: true,
                            maxLength: 9,
                            hint: "12,340,23",

                          ),
                        ),
                      ],
                    ),
                  ),
                  TitleInput(
                    title: "Year",
                    child:  Row(
                      children: [
                        SizedBox(
                          width: 172.w,
                          child: TextFieldWithBack(
                            controller: yearFromController,
                            textInputType: TextInputType.number,
                            prefixText: "From:",
                            maxLength: 4,
                            hint: "2016",
                          ),
                        ),
                        SizedBox( width: 14.w),
                        SizedBox(
                          width: 172.w,
                          child: TextFieldWithBack(
                            controller: yearToController,
                            textInputType: TextInputType.number,
                            prefixText: "To :",
                            maxLength: 4,
                            hint: "${DateTime.now().year}",

                          ),
                        ),
                      ],
                    ),
                  ),
                  TitleInput(
                    title: "Make",
                    child: TextFieldWithBack(
                      controller: makeController,
                      hint: "Infiniti",
                    ),
                  ),
                  // TitleInput(
                  //   title: "Model",
                  //   child: TextFieldWithBack(
                  //     controller: modelController,
                  //     hint: "Yukon Denali",
                  //   ),
                  // ),
                  TitleInput(
                    title: "Model",
                    child: SimpleSuggestion(
                      suggestionsList: ["aaaaaaa" , "aabb" , "aaccc" , "addd" , "fffff" , "eeee"],
                      controller: modelController,
                      focusNode: modelFocusNode,
                      characters: modelCharacters,
                      textChanged: (value){
                        modelCharacters = value!;
                      },
                    )
                  ),


                  OdometerInputTitle(
                    onChangeOdometerType: (OdometerType odometer){
                      odometerType = odometer;
                    },
                    odometerFromController: odometerFromController,
                    odometerToController: odometerToController,

                  ),

                  TitleInput(
                      title: "Body Style",
                      child:   SimpleDropDown(
                        itemList: items,
                      )
                  ),

                  SizedBox(
                    height: 700.h,
                  ),



                ],
                  ),
                ),
              )





            ],
          ),
        )
    );
  }
}
