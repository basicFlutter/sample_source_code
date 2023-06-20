import 'package:flutter/material.dart';
import 'package:new_panel/core/widgets/custom_body.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final TextEditingController searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBody(
      searchbarController: searchbarController,
      body: Column(
        children: [

          ElevatedButton(onPressed: (){
            Navigator.of(context).pop(["filter1" , "filter2"]);
          }, child: Text("aaaa"))

        ],
      ),
    );
  }
}
