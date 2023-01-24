import 'package:flutter/material.dart';

class CustomDescription extends StatelessWidget {
  final String text ;
  const CustomDescription({Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text , style: Theme.of(context).textTheme.bodySmall,);
  }
}
