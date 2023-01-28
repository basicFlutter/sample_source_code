
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../main.dart';


class CustomDropDownWidget extends StatefulWidget {
  CustomDropDownWidget(
      {Key? key,
        required this.items,
        required this.onChange,
        this.defaultText,
        this.buttonWidth,
        this.isDisabled ,
        this.valueStyle,
        this.shadowColor,
        this.title,
        this.dropdownValue,
        this.height, required this.label})
      : super(key: key);
  final List<String> items;

  void Function(String? value) onChange;
  final String? defaultText;
  final String? title;
  final double? buttonWidth;
  final Color? shadowColor;
  final TextStyle? valueStyle;
  final double? height;
  final String label ;
  final bool? isDisabled ;
  String? dropdownValue;

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          TextFormField(
            validator: (value){
              value = widget.dropdownValue;
              if(value == null){
                return '${widget.label} is required';
              }
              return null ;
            },
            decoration:  InputDecoration(
              label: Text(widget.label) ,
              floatingLabelBehavior:  FloatingLabelBehavior.always,
            )
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,

              items: widget.items
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: widget.valueStyle ??
                      Theme.of(context).textTheme.headlineMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: widget.dropdownValue,
              onChanged: (value) {
                logger.w(value);

                widget.onChange(value);
                setState(() {
                  widget.dropdownValue = value;
                });
              },
              style:   Theme.of(context).textTheme.headlineMedium,
              icon:  Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Theme.of(context).dividerColor,
                size: 24,
              ),
              disabledHint: Text(
                widget.defaultText ?? "",
                style: Theme.of(context).textTheme.headlineMedium,
                overflow: TextOverflow.fade,
              ),

              hint: Text(
                widget.defaultText ?? "",
                style:Theme.of(context).textTheme.headlineMedium,
                overflow: TextOverflow.fade,
              ),
              iconEnabledColor: Theme.of(context).primaryColor,
              iconDisabledColor: Theme.of(context).primaryColor,
              buttonHeight: widget.height ?? 60,
              buttonWidth:
              widget.buttonWidth ?? MediaQuery.of(context).size.width - 20,
              buttonPadding: const EdgeInsets.only(left: 10, right: 10),
              // buttonDecoration: BoxDecoration(
              //     borderRadius:
              //     BorderRadius.circular(AppDimensions.buttonRadius),
              //     border: Border.all(
              //       width: 1,
              //       color: Theme.of(context).dividerColor,
              //     ),
              //     color: Theme.of(context).backgroundColor),
              buttonElevation: 0,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              // dropdownWidth: 200,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).backgroundColor,
              ),

              dropdownElevation: 1,
              scrollbarRadius: const Radius.circular(5),
              scrollbarThickness: 1,
              scrollbarAlwaysShow: true,
              offset: const Offset(0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
