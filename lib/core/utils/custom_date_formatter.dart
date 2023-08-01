import 'package:intl/intl.dart';
import 'package:new_panel/main.dart';

class CustomDateFormatter{

  /// String input4 = "30.06.2023"; can not format
  /// String input5 = "06/30/2023"; can not format

  ///      String input1 = "2023-Jun-30";
  ///      String input2 = "22 Jun 2023";
  ///      String input3 = "2023/10/30";
  ///      String input6 = "June 22, 2023";
  ///      String input7 = "30 June 2023";
  ///      String input8 = "2023Jul30";
  ///
  ///
  ///      logger.e("$input1 => ${CustomDateFormatter.formatDateFromString(inputDate: input1 )}");
  ///      logger.e("$input2 => ${CustomDateFormatter.formatDateFromString(inputDate: input2 )}");
  ///      logger.e("$input3 => ${CustomDateFormatter.formatDateFromString(inputDate: input3 )}");
  ///      logger.e("$input6 => ${CustomDateFormatter.formatDateFromString(inputDate: input6 )}");
  ///      logger.e("$input7 => ${CustomDateFormatter.formatDateFromString(inputDate: input7 )}");
  ///      logger.e("$input8 => ${CustomDateFormatter.formatDateFromString(inputDate: input8 )}");

  static String formatDateFromString({required String inputDate }) {

    String? inputDateFormat = _getDatePattern(inputDate);



    String formattedDate = inputDate;
    DateTime?  date;
    try{


        date = DateFormat("$inputDateFormat").parse(inputDate);


      formattedDate = DateFormat('yyyy/MM/dd').format(date);

    }catch (e){
      logger.e(e);
    }


    // Return the formatted date string
    return formattedDate;
  }

  static String? _getDatePattern(String input) {


    RegExp patterns = RegExp(r'(\d{4}-\w{3}-\d{2})|(\d{2}\s\w{3}\s\d{4})|(\d{4}\/\d{2}\/\d{2})|(\d{4}[a-zA-Z]{3}\d{2})|(\d{4}\s[a-zA-Z]{3}\s\d{2})|(\w{4}\s\d{2},\s\d{4})|(\d{2}\s\w{4}\s\d{4})|(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z)|(\d{4}-\d{2}-\d{2})' // yyyyMMMdd
    );

    Match? match = patterns.firstMatch(input);


    if(match?.group(1) != null){
      logger.w("yyyy-MMM-dd");
      return "yyyy-MMM-dd";
    }else if(match?.group(2) != null){
      logger.w("dd MMM yyyy");
      return "dd MMM yyyy";
    }
    else if(match?.group(3) != null){
      logger.w("yyyy/MM/dd");
      return "yyyy/MM/dd";
    }
    else if(match?.group(4) != null){
      logger.w("yyyyMMMdd");
      return "yyyyMMMdd";
    } else if(match?.group(5) != null){
      logger.w("yyyy MMM dd");
      return "yyyy MMM dd";
    }
    else if(match?.group(6) != null){
      logger.w("MMMM dd, yyyy");
      return "MMMM dd, yyyy";
    }
    else if(match?.group(7) != null){
      logger.w("dd MMMM yyyy");
      return "dd MMMM yyyy";
    }
    else if(match?.group(8) != null){
      logger.w("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
      return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    } else if(match?.group(9) != null){
      logger.w("yyyy-MM-dd");
      return "yyyy-MM-dd";
    }


  }


}