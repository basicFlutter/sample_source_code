import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/widgets/custom_body_with_logo.dart';
import 'package:new_panel/core/widgets/custom_couple_button.dart';
import 'package:new_panel/core/widgets/custom_description.dart';
import 'package:new_panel/core/widgets/custom_input.dart';

import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/large_title.dart';
import 'package:new_panel/core/widgets/subtitle.dart';

import '../../../../core/widgets/custom_check_box.dart';
import '../../../../core/widgets/custom_space.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController codeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBodyWithLogo(
        body: _body(),
        spaceFromBottom:54.h ,
        bodyHeight: 449.h,
      ),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: _title(),
        ),
        const CustomDescription(
            text:
                'There is not any activity report from this device over the last 7  days to show that it is really you, complete the task below'),
        const CustomSpace(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child:  Subtitle(text: 'Enter Code'),
        ),
        CustomInput(
          inputController: codeController,
          label: 'code',
        ),
        const CustomSpace(),
        Row(
          children: [
            CustomCheckBox(isChecked:false) ,
            const CustomText(text: 'Dont  ask me again on this device')],
        ),
        const CustomSpace(),
        CustomCoupleButton(
            rightOnTab: () {},
            leftOnTab: () {},
            rightButtonText: 'Login',
            leftButtonText: 'Cancel')
      ],
    );
  }

  Widget _title() {
    return Row(
      children:  [
        SvgPicture.asset(AppImages.verifyMobile) ,
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: LargeTitle(text: 'Verify Your Identity'),
        ),
      ],
    );
  }
}
