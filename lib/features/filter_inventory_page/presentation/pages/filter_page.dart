import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/models/drop_down_model.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/core/widgets/custom_body_with_bottomNavigation.dart';
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

class _FilterPageState extends State<FilterPage> with SingleTickerProviderStateMixin{
  TextEditingController searchController = TextEditingController();
  TextEditingController totalCostFromController = TextEditingController();
  TextEditingController totalCostToController = TextEditingController();
  TextEditingController yearFromController = TextEditingController();
  TextEditingController yearToController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController odometerFromController = TextEditingController();
  TextEditingController odometerToController = TextEditingController();
  String modelCharacters = '';
  String colorCharacters = '';

  FocusNode modelFocusNode = FocusNode();
  FocusNode colorFocusNode = FocusNode();
  OdometerType odometerType = OdometerType.km;
  List<DropDownModel> bodyStyleList = [
    DropDownModel(title: "Sedan"),
    DropDownModel(title: "Suv"),
    DropDownModel(title: "Coupe"),
    DropDownModel(title: "Van"),
  ];
  List<String> colorList = [
    "Green",
    "Red",
    "Blue",
    "Gray",
  ];
  List<String> modelList = [
    "aaa",
    "bb",
    "cc",
    "dd",
  ];
 //  late AnimationController _controller;
 // late Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    // _animation = Tween(begin: 300.h, end: 0).animate(_controller)
    //   ..addListener(() {
    //     setState(() {});
    //   });
    //
    // modelFocusNode.addListener(() {
    //   if (modelFocusNode.hasFocus) {
    //     _controller.forward();
    //   } else {
    //     _controller.reverse();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return CustomBodyWithBottomNavigation(
        searchbarController: searchController,
        indexPageSelected: 1,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(

            children: [
              AppBarCustom(
                title: "Filter",
                height: 65.h,
                onTapBack: (){
                  Navigator.of(context).pop();
                },
                actions:  RoundCornerButton(
                  width: 60.w,
                  height: 35.h,
                  title: "Reset",
                  onTap: (){

                  },
                ),
              ),

              SizedBox(
                height: (670-69).h,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    margin:  EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                    TitleInput(
                      title: "Model",
                      child: SimpleSuggestion(
                        suggestionsList: modelList,
                        controller: modelController,
                        focusNode: modelFocusNode,
                        characters: modelCharacters,
                        hint: "Yukon Denali",
                        textChanged: (value){
                          modelCharacters = value!.toLowerCase();
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
                          itemList: bodyStyleList,
                        )
                    ),

                  TitleInput(
                      title: "Color",
                      child: SimpleSuggestion(
                        suggestionsList: colorList,
                        controller: colorController,
                        focusNode: colorFocusNode,
                        characters: colorCharacters,
                        hint: "Green",
                        textChanged: (value){
                          colorCharacters = value!.toLowerCase();
                        },
                      )
                  ),


                    SizedBox(
                      height: 30.h,
                    ),

                    RoundCornerButton(
                        width: 169.w,
                        title: "Done",
                        height: 46.h,
                      onTap: (){

                      },
                    ),


                    SizedBox(
                      height: 30.h,
                    ),



                ],
                    ),
                  ),
                ),
              )





            ],
          ),
        )
    );
  }
}
