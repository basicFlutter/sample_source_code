import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class DialogCloseButton extends StatelessWidget {
  const DialogCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: AppColors.titleColor,
            ))
      ],
    );
  }
}
