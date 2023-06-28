import 'package:new_panel/core/enums/app_enums.dart';

class FilterParams{

  String? minPrice;
  String? maxPrice;
  String? minTotalCost;
  String? maxTotalCost;
  String? minYear;
  String? maxYear;
  String? make;
  String? model;
  String? minOdometer;
  String? maxOdometer;
  OdometerType? odometerType;
  String? bodyStyle;
  String? color;
  FilterParams({
   required this.odometerType,
  required this.bodyStyle,
  required this.color,
  required this.model,
  required this.make,
  required this.maxOdometer,
  required this.maxPrice,
  required this.maxTotalCost,
  required this.maxYear,
  required this.minOdometer,
  required this.minPrice,
  required this.minTotalCost,
  required this.minYear
});

  List<String> toList(){

    String priceFilter = "";
    if((minPrice != null && minPrice?.trim() !="") && (maxPrice != null && maxPrice?.trim() != "")){
      priceFilter = "P: \$${minPrice!} - \$${maxPrice!}";
    } else if((minPrice != null && minPrice?.trim() !="") && (maxPrice == null || maxPrice?.trim() == "")){
      priceFilter = "P: \$${minPrice!}";
    } else if((minPrice == null && minPrice?.trim() =="") && (maxPrice != null || maxPrice?.trim() != "")){
      priceFilter = "\$$maxPrice!";
    }


    String totalCostFilter = "";
    if((minTotalCost != null && minTotalCost?.trim() !="") && (maxTotalCost != null && maxTotalCost?.trim() != "")){
      totalCostFilter = "TC: \$${minTotalCost!} - \$${maxTotalCost!}";
    } else if((minTotalCost != null && minTotalCost?.trim() !="") && (maxTotalCost == null || maxTotalCost?.trim() == "")){
      totalCostFilter = "TC: \$${minTotalCost!}";
    } else if((minTotalCost == null && minTotalCost?.trim() =="") && (maxTotalCost != null || maxTotalCost?.trim() != "")){
      totalCostFilter = "TC: \$${maxTotalCost!}";
    }

    String yearFilter = "";
    if((minYear != null && minYear?.trim() !="") && (maxYear != null && maxYear?.trim() != "")){
      yearFilter = "${minYear!} - ${maxYear!}";
    } else if((minYear != null && minYear?.trim() !="") && (maxYear == null || maxYear?.trim() == "")){
      yearFilter = minYear!;
    } else if((minYear == null && minYear?.trim() =="") && (maxYear != null || maxYear?.trim() != "")){
      yearFilter = maxYear!;
    }
    String odometerFilter = "";
    if((minOdometer != null && minOdometer?.trim() !="") && (maxOdometer != null && maxOdometer?.trim() != "")){
      odometerFilter = "${minOdometer!} - ${maxTotalCost!}";
    } else if((minOdometer != null && minOdometer?.trim() !="") && (maxOdometer == null || maxOdometer?.trim() == "")){
      odometerFilter = minOdometer!;
    } else if((minOdometer == null && minOdometer?.trim() =="") && (maxOdometer != null || maxOdometer?.trim() != "")){
      odometerFilter = maxOdometer!;
    }

    List<String> filterList = [
      priceFilter,
      totalCostFilter,
      yearFilter,
      make??"",
      model??"",
      odometerFilter.replaceAll(",", "."),
      bodyStyle??"",
      color??"",
    ];
    filterList.removeWhere((item) => item == '');

    return filterList;
  }
}