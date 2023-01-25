

import 'package:flutter/material.dart';

class LargeTitle extends StatelessWidget {
  final String text ;
  const LargeTitle({Key? key , required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text ,
    style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
