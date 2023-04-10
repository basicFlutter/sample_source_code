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
        _detailItem(context:context , label: 'label' , value: 'value ') ,
        _detailItem(context:context , label: 'label' , value: 'value ' ) ,
        _detailItem(context:context , label: 'label' , value: 'value ') ,
        _detailItem(context:context , label: 'label' , value: 'value ') ,
        _detailItem(context:context , label: 'label' , value: 'value ') ,
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
