import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String text ;
  const Subtitle({Key? key , required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text , style: Theme.of(context).textTheme.titleSmall);
  }
}
