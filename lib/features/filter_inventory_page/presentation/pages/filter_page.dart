import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/models/drop_down_model.dart';
import 'package:new_panel/core/params/filter_params.dart';
import 'package:new_panel/core/suggestions/domain/entities/body_style_entity.dart';
import 'package:new_panel/core/suggestions/domain/entities/color_entity.dart';
import 'package:new_panel/core/suggestions/presentation/manager/status/get_body_style_status.dart';
import 'package:new_panel/core/suggestions/presentation/manager/status/get_color_status.dart';
import 'package:new_panel/core/suggestions/presentation/manager/suggestion_bloc.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/custom_body_with_bottomNavigation.dart';
import 'package:new_panel/core/widgets/odometer_input_title.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/core/widgets/simpleDropDown.dart';
import 'package:new_panel/core/widgets/simple_suggestion.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/slider_price.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/title_input.dart';


class FilterPage extends StatefulWidget {
   FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  TextEditingController searchController = TextEditingController();

  TextEditingController priceFromController = TextEditingController();

  TextEditingController priceToController = TextEditingController();

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

  String bodyStyle= "";

  String color ="";

  // @override
  @override
  Widget build(BuildContext context) {
    return CustomBodyWithBottomNavigation(
        searchbarController: searchController,
        indexPageSelected: 1,

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(

            children: [
              AppBarCustom(
                title: "Filter",
                height: 65.h,
                onTapBack: () {
                  Navigator.of(context).pop();
                },
                actions: RoundCornerButton(
                  width: 60.w,
                  height: 35.h,
                  title: "Reset",
                  onTap: () {

                  },
                ),
              ),

              SizedBox(
                height: (670 - 69).h,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.only(bottom: MediaQuery
                        .of(context)
                        .viewInsets
                        .bottom),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SliderPrice(
                          priceFromController: priceFromController,
                          priceToController: priceToController,
                        ),
                        TitleInput(
                          title: "Total Cost",
                          marginTop: 0,
                          child: Row(
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
                              SizedBox(width: 14.w),
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
                          child: Row(
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
                              SizedBox(width: 14.w),
                              SizedBox(
                                width: 172.w,
                                child: TextFieldWithBack(
                                  controller: yearToController,
                                  textInputType: TextInputType.number,
                                  prefixText: "To :",
                                  maxLength: 4,
                                  hint: "${DateTime
                                      .now()
                                      .year}",

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
                              textChanged: (value) {
                                modelCharacters = value!.toLowerCase();
                              },
                            )
                        ),


                        OdometerInputTitle(
                          onChangeOdometerType: (OdometerType odometer) {
                            odometerType = odometer;
                          },
                          odometerFromController: odometerFromController,
                          odometerToController: odometerToController,

                        ),


                        BlocConsumer<SuggestionsBloc, SuggestionState>(
                          listener: (context, state) {
                            if(state.getBodyStyleStatus is GetBodyStyleCompletedStatus){
                              GetBodyStyleCompletedStatus getBodyStyleCompletedStatus= state.getBodyStyleStatus as GetBodyStyleCompletedStatus;

                              for(BodyStyleEntity bodyStyle in getBodyStyleCompletedStatus.bodyStyleEntityList){
                                if(bodyStyle.name != null){
                                  bodyStyleList.add(
                                      DropDownModel(title: bodyStyle.name!)
                                  );
                                }
                              }

                            }
                          },
                          builder: (context, state) {
                            return TitleInput(
                                title: "Body Style",

                                child: SimpleDropDown(
                                  itemList: bodyStyleList,
                                  onSelected: (dropDownValue){
                                    bodyStyle = dropDownValue.title;
                                  },
                                )
                            );
                          },
                        ),

                        BlocConsumer<SuggestionsBloc, SuggestionState>(
                          listener: (context, state) {
                            if (state
                                .getColorStatus is GetColorCompletedStatus) {
                              GetColorCompletedStatus getColorCompletedStatus = state
                                  .getColorStatus as GetColorCompletedStatus;
                              List<
                                  ColorEntity> colorListEntity = getColorCompletedStatus
                                  .colorList;
                              colorList.clear();
                              for (ColorEntity color in colorListEntity) {
                                if (color.name != null) {
                                  colorList.add(color.name!);
                                }
                              }
                            }
                          },
                          builder: (context, state) {
                            return TitleInput(
                                title: "Color",
                                marginTop: 35.h,
                                child: SimpleSuggestion(
                                  suggestionsList: colorList,
                                  controller: colorController,
                                  focusNode: colorFocusNode,
                                  characters: colorCharacters,
                                  hint: "Green",
                                  textChanged: (value) {
                                    colorCharacters = value!.toLowerCase();
                                  },
                                )
                            );
                          },
                        ),


                        SizedBox(
                          height: 30.h,
                        ),

                        RoundCornerButton(
                          width: 169.w,
                          title: "Done",
                          height: 46.h,
                          onTap: () async{

                            FilterParams filterParams = FilterParams(
                                odometerType: odometerType,
                                minOdometer: odometerFromController.text,
                                maxOdometer: odometerToController.text,
                                minYear: yearFromController.text,
                                maxYear: yearToController.text,
                                minPrice: priceFromController.text,
                                maxPrice: priceFromController.text,
                                minTotalCost: totalCostFromController.text,
                                maxTotalCost: totalCostToController.text,
                                bodyStyle: bodyStyle,
                                make: makeController.text,
                                model: modelController.text,
                                color: colorController.text
                            );

                            List<String> filterList = filterParams.toList();

                            Navigator.pop(context,filterList);

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


