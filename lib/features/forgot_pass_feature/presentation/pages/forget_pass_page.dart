import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_panel/core/widgets/custom_couple_button.dart';
import 'package:new_panel/core/widgets/custom_error_widget.dart';
import 'package:new_panel/core/widgets/custom_input.dart';
import 'package:new_panel/core/widgets/de_active_button.dart';
import 'package:new_panel/core/widgets/large_title.dart';
import 'package:new_panel/features/forgot_pass_feature/data/models/forget_pass_map_model.dart';
import 'package:new_panel/features/forgot_pass_feature/presentation/manager/status/forget_pass_status.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/service_locator.dart';
import '../../../../core/widgets/custom_body_with_logo.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_space.dart';
import '../../../login_feature/presentation/manager/status/login_status.dart';
import '../../../login_feature/presentation/widgets/hillz_text.dart';
import '../../../login_feature/presentation/widgets/login_container.dart';
import '../manager/forget_pass_bloc.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isVisibleError = false;
  String messageError = '';
  String srcIconError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => ForgetPassBloc(forgetPassUseCase: locator()),
        child: CustomBodyWithLogo(
          body: BlocListener<ForgetPassBloc, ForgetPassState>(
            listener: (context, state) {
              if(state.forgetPassStatus is FailedLoginStatus){
                FailedLoginStatus failedLoginStatus = state.forgetPassStatus as FailedLoginStatus;
                isVisibleError = true;
                messageError = failedLoginStatus.error.message??"";
              }
              if(state.forgetPassStatus is SuccessLoginStatus){
                isVisibleError = false;
              }
            },
            child: BlocBuilder<ForgetPassBloc, ForgetPassState>(
              builder: (context, state) {
                if (state is LoadingForgetPass) {
                  return const CustomLoading();
                } else if (state is SuccessForgetPassStatus) {
                  return _forgetPassBody(context , state );
                }
                return _forgetPassBody(context , state );
              },
            ),
          ),
          bodyHeight: 357.h,
          spaceFromBottom: 38.5.h,
          spaceFromTop: 38.5.h,
        ),
      ),
    );
  }

  Widget _forgetPassBody(BuildContext context , ForgetPassState state) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _title(),
            CustomErrorWidget(errorText: messageError, isVisible: state.forgetPassStatus is FailedForgetPassStatus ? true : false  , iconSrc: AppImages.testSvg) ,

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
                if (formKey.currentState!.validate()) {
                  ForgetPassMapModel forgetPassData = ForgetPassMapModel(
                      username: usernameController.text,
                      email: emailController.text);

                  BlocProvider.of<ForgetPassBloc>(context).add(ForgetPassEvent(
                      forgetPassData: forgetPassData, context: context));
                }
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
