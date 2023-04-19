import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailExpansionChildren extends StatefulWidget {
  const DetailExpansionChildren({Key? key}) : super(key: key);

  @override
  State<DetailExpansionChildren> createState() => _DetailExpansionChildrenState();
}

class _DetailExpansionChildrenState extends State<DetailExpansionChildren> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _detailItem(context:context , label: 'TRIM' , value: 'value ') ,
        _detailItem(context:context , label: 'ENGINE' , value: 'value ' ) ,
        _detailItem(context:context , label: 'ENGINE SIZE' , value: 'value ') ,
        _detailItem(context:context , label: 'DRIVETRAIN' , value: 'value ') ,
        _detailItem(context:context , label: 'PASSENGER' , value: 'value ') ,
        _detailItem(context:context , label: 'FUEL TYPE' , value: 'value ') ,
        _detailItem(context:context , label: 'DOORS' , value: 'value ') ,
        _detailItem(context:context , label: 'STOCK NUMBER' , value: 'value ') ,
        _detailItem(context:context , label: 'VIN NUMBER' , value: 'value ') ,
        _detailItem(context:context , label: 'INTERIOR COLOR' , value: 'value ') ,
        _detailItem(context:context , label: 'EXTERIOR COLOR' , value: 'value ') ,

      ],
    );
  }

  Widget _detailItem({required BuildContext context , required String label , required String value }) {
    return Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w ),
        child: Container(
          decoration: BoxDecoration(
            border:Border(bottom: BorderSide(width:1 , color: Theme.of(context).colorScheme.shadow))
          ),
          child: Padding(
            padding: EdgeInsets.symmetric( vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(label , style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.surface
              ),),
              Text(value, style: Theme.of(context).textTheme.labelLarge,)
            ],),
          ),
        ),
      );
  }
}
