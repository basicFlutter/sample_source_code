import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/core/utils/custom_date_formatter.dart';
import 'package:new_panel/core/widgets/back_textField.dart';
import 'package:new_panel/core/widgets/custom_input.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';
import 'package:new_panel/main.dart';

class CustomDatePicker extends StatefulWidget {
   CustomDatePicker({Key? key , required this.isRequired , required this.onSelectedDate , this.initDate , this.showHintDate}) : super(key: key);
  final bool isRequired ;
   Function(String) onSelectedDate;
   String? initDate;
   final bool? showHintDate;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final GlobalKey<BackTextFieldState> backTextFieldKey = GlobalKey<BackTextFieldState>();
  // DateTime dateTime = DateTime.now();
  DateFormat dateFormatter = DateFormat('yyyy-MMM-dd');
  TextEditingController dateController = TextEditingController();






  // var dateString = dateFormatter.format(date);

  @override
  Widget build(BuildContext context) {

    return TextFieldWithBack(
      controller: dateController,
      readOnly: true,
      readOnlyText:widget.initDate != null ? CustomDateFormatter.formatDateFromString(inputDate: widget.initDate! ) : "",
      isRequired: widget.isRequired,
      suffixIcon: Icons.calendar_today,
      hintReadOnly: (widget.showHintDate ?? false) ? CustomDateFormatter.formatDateFromString(inputDate: DateTime.now().toString()) : null,
      onTap: () async{
        final date = await AppUtils.showCustomDialog( context);
        if(date != null){
          widget.onSelectedDate(dateFormatter.format(date));
          widget.initDate = dateFormatter.format(date);

          setState(() {

          });

        }
      },

    );
  }
}

