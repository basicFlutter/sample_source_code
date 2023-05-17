import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_dimensions.dart';

class SearchbarWidget extends StatefulWidget {
  TextEditingController searchbarController ;
  String? fieldHint ;
  SearchbarWidget({Key? key , required this.searchbarController , this.fieldHint}) : super(key: key);

  @override
  State<SearchbarWidget> createState() => _SearchbarWidgetState();
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Material( elevation: 2.0,
                borderRadius:  BorderRadius.all(Radius.circular(12.r)),
                child: SizedBox(
                    height: 40.h ,
                    // width: 358.w,
                    child: PhysicalModel (
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      color: Theme.of(context).colorScheme.tertiary,
                      child: TextFormField(
                        controller : widget.searchbarController ,
                        decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide( width: 0,
                                style: BorderStyle.none,),
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            contentPadding:  EdgeInsets.symmetric(vertical: 8.h , horizontal: 5.w) ,
                            prefixIcon: Icon(Icons.search , color: Theme.of(context).colorScheme.onTertiary,),
                            hintText:widget.fieldHint ??  'Search All',
                            hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: Theme.of(context).colorScheme.onTertiary
                            ),
                            filled: true ,
                            fillColor: Theme.of(context).colorScheme.tertiary
                        ),
                      ),
                    )),
              ))  ,
          // _filterButton(context)
        ],),
    );
  }

}
