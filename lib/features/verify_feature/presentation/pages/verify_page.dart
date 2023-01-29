import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/widgets/custom_body_with_logo.dart';
import 'package:new_panel/core/widgets/custom_couple_button.dart';
import 'package:new_panel/core/widgets/custom_description.dart';
import 'package:new_panel/core/widgets/custom_dropdown_widget.dart';
import 'package:new_panel/core/widgets/custom_input.dart';

import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/medium_title.dart';

import 'package:new_panel/core/widgets/subtitle.dart';
import 'package:new_panel/features/verify_feature/data/models/verify_map_model.dart';

import '../../../../core/widgets/custom_check_box.dart';
import '../../../../core/widgets/custom_space.dart';
import '../../../../core/widgets/large_title.dart';
import '../manager/verify_bloc.dart';

class VerifyPage extends StatefulWidget {
  final String username;

  final String password;

  const VerifyPage({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => VerifyBloc(verifyUseCase: locator()),
        child: CustomBodyWithLogo(
          body: BlocBuilder<VerifyBloc, VerifyState>(
            builder: (context, state) {
              return _body(context);
            },
          ),
          spaceFromBottom: 54.h,
          bodyHeight: 449.h,
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
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
              child: MediumTitle(text: 'Enter Code'),
            ),
            CustomInput(
              inputController: codeController,
              isRequired: true,
              label: 'code',
            ),
            const CustomSpace(),
            Row(
              children: [
                CustomCheckBox(
                  isChecked: isRememberMe,
                  onChecked: (value) {
                    isRememberMe = value;
                  },
                ),
                const CustomText(text: 'Dont ask me again on this device')
              ],
            ),
            const CustomSpace(),
            CustomCoupleButton(
                rightOnTab: () {
                  if (formKey.currentState!.validate()) {
                    VerifyMapModel userInfo = VerifyMapModel(
                        username: widget.username,
                        password: widget.password,
                        code: codeController.text,
                        rememberMe: isRememberMe);

                    BlocProvider.of<VerifyBloc>(context)
                        .add(VerifyCodeEvent(verifyInfo: userInfo, context: context));

                    codeController.clear();
                  }
                },
                leftOnTab: () {
                  Navigator.of(context).pop();
                },
                rightButtonText: 'Login',
                leftButtonText: 'Cancel')
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Row(
      children: [
        SvgPicture.asset(AppImages.verifyMobile),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: LargeTitle(text: 'Verify Your Identity'),
        ),
      ],
    );
  }
}
