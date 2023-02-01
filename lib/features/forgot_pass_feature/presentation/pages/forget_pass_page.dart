import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_panel/core/widgets/custom_couple_button.dart';
import 'package:new_panel/core/widgets/custom_error_widget.dart';
import 'package:new_panel/core/widgets/custom_input.dart';
import 'package:new_panel/core/widgets/de_active_button.dart';
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

  // Navigator.of(context).push(
  // AnimationTransitionClass.createRouteAnimation(
  // const ForgetPassPage(),
  // textDirection: TextDirection.rtl,
  // isSlide: false
  // ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: ,
      body: CustomBodyWithLogo(
        body: _forgetPassBody(),
        bodyHeight: 357.h,
        spaceFromBottom:38.5.h ,
        spaceFromTop: 38.5.h,
      ),
    );
  }

  Widget _forgetPassBody() {
    return Form(
      key: formKey, 
      child: SingleChildScrollView(
        child: Column(
          children: [
            _title(),
            CustomErrorWidget(errorText: 'kjad dsafd dfads ', isVisible: false,iconSrc: AppImages.testSvg) ,
            SizedBox(
              height: 20.h,
            ),

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
                FocusScope.of(context).unfocus();
              },
              leftOnTab: () {
                FocusScope.of(context).unfocus();

                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return SizedBox(
      height: 48.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0.w),
            child: SvgPicture.asset(AppImages.forgetPass),
          ),
          const LargeTitle(text: 'Forgot your password'),
        ],
      ),
    );
  }
}
