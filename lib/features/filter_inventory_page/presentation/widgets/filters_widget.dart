import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/slider_price.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/title_input.dart';

class FiltersWidget extends StatefulWidget {
  const FiltersWidget({Key? key}) : super(key: key);

  @override
  State<FiltersWidget> createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  TextEditingController searchController = TextEditingController();
  TextEditingController totalCostFromController = TextEditingController();
  TextEditingController totalCostToController = TextEditingController();
  TextEditingController yearFromController = TextEditingController();
  TextEditingController yearToController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
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
          TitleInput(
            title: "Model",
            child: TextFieldWithBack(
              controller: modelController,
              hint: "Yukon Denali",
            ),
          ),
        ],
      ),
    );
  }
}
