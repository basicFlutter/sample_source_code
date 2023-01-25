import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_panel/core/widgets/custom_couple_button.dart';
import 'package:new_panel/core/widgets/custom_input.dart';
import 'package:new_panel/core/widgets/large_title.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_body_with_logo.dart';
import '../../../../core/widgets/custom_space.dart';
import '../../../login_feature/presentation/widgets/hillz_text.dart';
import '../../../login_feature/presentation/widgets/login_container.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      body: CustomBodyWithLogo(
        body: _forgetPassBody(),
        bodyHeight: 382.h,
        spaceFromBottom:60.h ,
      ),
    );
  }

  Widget _forgetPassBody() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _title(),
          const CustomSpace(),
          CustomInput(
              isRequired: true,
              inputController: usernameController,
              label: 'Username'),
          const CustomSpace(),
          CustomInput(
              isRequired: true,
              inputController: emailController,
              label: 'Email Address'),
          const CustomSpace(),
          CustomCoupleButton(
            rightButtonText: 'Submit',
            leftButtonText: 'Cancel',
            rightOnTab: () {
              if (formKey.currentState!.validate()) {}
            },
            leftOnTab: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Widget _title() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SvgPicture.asset(AppImages.forgetPass),
        ),
        const LargeTitle(text: 'Forgot your password'),
      ],
    );
  }
}
