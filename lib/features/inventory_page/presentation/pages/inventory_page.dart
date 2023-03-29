import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/widgets/custom_tag.dart';
import 'package:new_panel/core/widgets/dialog_close_button.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/status/get_inventpries_status.dart';

import '../../../../core/widgets/custom_body.dart';
import '../manager/inventory_bloc.dart';
import '../manager/status/inventory_page_status.dart';
import '../widgets/inventory_list.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  bool isSearchMode = false;

  bool isSelect = false;

  TextEditingController searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InventoryBloc>(
      create: (context) => InventoryBloc(getInventoryUseCase: locator())
        ..add(GetInventoriesEvent(stateType: '3')),
      child: Scaffold(
        body: BlocConsumer<InventoryBloc, InventoryState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return BlocBuilder<InventoryBloc, InventoryState>(
              builder: (context, state) {
                if (state.inventoryPageStatus is ChangeSelectModeStatus) {
                  ChangeSelectModeStatus currentState = state.inventoryPageStatus as ChangeSelectModeStatus;
                  isSelect = currentState.isSelectMode;
                }
                if (state.getInventoryStatus is SuccessGetInventoryStatus) {
                  SuccessGetInventoryStatus successState = state.getInventoryStatus as SuccessGetInventoryStatus ;

                  return CustomBody(
                    searchbarController: searchbarController,
                    body: _inventoryBody(context),
                  );
                }else if(state.getInventoryStatus is LoadingGetInventoryStatus){
                  return CustomBody(
                    searchbarController: searchbarController,
                    body:Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary,)),
                  );
              ;  }

                return Container();
              },
            );
          },
        ),
      ),
    );
  }

  Widget _inventoryBody(BuildContext context ) {
    return Column(
      children: [
        isSelect ? _selectWidget(context) : _tags(),
        SizedBox(
          height: 6.h,
        ),
        isSelect ? _selectOptions(context) : _filterOptions(context),
        SizedBox(
          height: 5.h,
        ),
        Expanded(child: InventoryList())
      ],
    );
  }

  Widget _selectOptions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Wrap(
        children: [_selectItems(context, 'Pending')],
      ),
    );
  }

  Widget _selectItems(BuildContext context, String title) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                offset: const Offset(0, 1),
                blurRadius: 0,
                spreadRadius: 0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          color: Theme.of(context).colorScheme.secondary),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 23.w),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  Widget _selectWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '5 Selected',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextButton(
              onPressed: () {
                BlocProvider.of<InventoryBloc>(context)
                    .add(ChangeSelectModeEvent(isSelectMode: false));
              },
              child: const Text('Done'))
        ],
      ),
    );
  }

  Widget _filterOptions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: SizedBox(
        height: 42.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.filter,
                    width: 35,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  if (!isSearchMode) _searchButton() else _searchField(context),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        insetPadding: const EdgeInsets.all(10),
                        contentPadding: const EdgeInsets.all(10),
                        content: _dialogContent(context),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      );
                    });
              },
              child: Container(
                  height: 40.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.shadow,
                      borderRadius: BorderRadius.all(Radius.circular(6.r))),
                  child: DropdownButton2(
                    underline: const SizedBox(),
                    items: const [],
                    barrierColor: Theme.of(context).colorScheme.secondary,
                    hint: Text(
                      'Inventory',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  )),
            )
            // SvgPicture.asset(AppImages.more , width: 35,  ) ,
          ],
        ),
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.tertiary,
            Theme.of(context).colorScheme.primary
          ]),
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Theme.of(context).colorScheme.background),
          child: TextFormField(
            controller: searchbarController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isSearchMode = false;
                  });
                },
                icon: Icon(Icons.close,
                    size: 20,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 12.w, top: 2.h, bottom: 2.h),
                child: SvgPicture.asset(
                  AppImages.search,
                  width: 35,
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.white, width: 0.5),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.white, width: 0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSearchMode = !isSearchMode;
        });
      },
      child: SvgPicture.asset(
        AppImages.search,
        width: 35,
      ),
    );
  }

  Widget _dialogContent(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const DialogCloseButton(),
          _dialogItem(context, false, 'Appraisal'),
          _dialogItem(context, true, 'Coming soon'),
          _dialogItem(context, false, 'Active Inventory'),
          _dialogItem(context, false, 'Pending'),
          _dialogItem(context, false, 'Delete'),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }

  Widget _dialogItem(BuildContext context, bool isSelected, String itemTitle) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              color: isSelected
                  ? Theme.of(context).colorScheme.surfaceTint
                  : Colors.transparent),
          child: Padding(
            padding:
                EdgeInsets.only(right: 100.w, left: 6.w, top: 5.h, bottom: 5.h),
            child: Text(
              itemTitle,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          )),
    );
  }

  Widget _tags() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: SizedBox(
        height: 70.h,
        child: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: [
            CustomTag(tagString: 'Total: \$ 900', onTap: () {}),
            CustomTag(tagString: 'Active: \$ 320', onTap: () {}),
            CustomTag(
                tagString: 'Total Retail Price: \$ 32,700,557', onTap: () {}),
            CustomTag(
                tagString: 'Total Purchase Price: \$ 322,700', onTap: () {}),
            CustomTag(tagString: 'Deactivate: 500', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
