import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';

class SearchBarWidget extends StatelessWidget {
  String? label;
  Function()? onTapFilter;
  TextEditingController searchbarController;
  SearchBarWidget(
      {Key? key,
      required this.searchbarController,
      this.label,
      this.onTapFilter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return searchBar(context);
  }

  Widget searchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          _filter(),
          Expanded(child: _search(context)),
        ],
      ),
    );
  }

  Widget _filter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: onTapFilter ?? () {},
        icon: Icon(
          Icons.filter_list_alt,
          size: AppDimensions.icon,
        ),
      ),
    );
  }

  Widget _search(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppDimensions.circle)),
        boxShadow: [
          BoxShadow(
            color: AppColors.unselected,
            blurRadius: 1,
            offset: Offset(2, 2), // Shadow position
          )
        ],
      ),
      child: TextField(
        controller: searchbarController,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.circle),
                borderSide: BorderSide.none),
            hintText: label ?? 'Search...',
            hintStyle: AppStyles.body2.copyWith(color: Colors.grey),
            suffixIcon: _suffix(context)),
      ),
    );
  }

  Widget _suffix(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Icon(
            Icons.search,
            size: AppDimensions.icon,
            color: Theme.of(context).indicatorColor,
          ),
        ),
      ),
    );
  }
}
