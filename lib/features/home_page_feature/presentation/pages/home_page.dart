import 'package:flutter/material.dart';
import 'package:new_panel/core/widgets/custom_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(searchbarController:searchbarController, body: Container() ,),
    );
  }
}
