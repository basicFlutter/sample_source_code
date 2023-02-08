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
    return Container(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        child: Padding(
      padding:  EdgeInsets.only(top: 11.h , bottom: 19.h ,right: 20.w , left: 20.w ),
      child: _searchbar(context ),
    ));
  }


  Widget _searchbar(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _field(context))  ,
          // _filterButton(context)
        ],),
    );
  }

  Widget _field(BuildContext context) {
    return SizedBox(
              height: 48.h ,
              width: 318.w,
              child: TextFormField(
                controller : widget.searchbarController ,
                decoration:  InputDecoration(

                  contentPadding: const EdgeInsets.symmetric(vertical: 5) ,
                  prefixIcon: Icon(Icons.search , color: Theme.of(context).dividerColor,),
                  hintText:widget.fieldHint ??  'Search...',
                    hintStyle: Theme.of(context).textTheme.displayMedium,
                    filled: true ,
                    fillColor: Theme.of(context).backgroundColor
                ),
              ));
  }

  Widget _filterButton(BuildContext context) {
    return Padding(
            padding:  EdgeInsets.only( left: 20.h ),
            child: GestureDetector(
              child: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(AppDimensions.circle))
                ),
                child: Icon(Icons.filter_list_alt  ,color: Theme.of(context).primaryColor,),
              ),
            ),
          );
  }
}
