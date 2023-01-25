

import 'package:flutter/material.dart';

class MediumTitle extends StatelessWidget {
  final String text ;
  const MediumTitle({Key? key , required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text ,
    style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
