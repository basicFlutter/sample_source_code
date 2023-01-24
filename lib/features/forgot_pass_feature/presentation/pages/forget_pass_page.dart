import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/custom_couple_button.dart';
import 'package:new_panel/core/widgets/custom_input.dart';
import 'package:new_panel/core/widgets/custom_title.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_body_with_logo.dart';
import '../../../login_feature/presentation/widgets/hillz_text.dart';
import '../../../login_feature/presentation/widgets/login_container.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  TextEditingController usernameController = TextEditingController() ;
  TextEditingController emailController = TextEditingController() ;
  GlobalKey<FormState> formKey = GlobalKey() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      body: CustomBodyWithLogo(body:_forgetPassBody(), bodyHeight: 352.h,),
    );
  }

  Widget _forgetPassBody(){
    return  Form(
      key: formKey,
      child: Column(children: [
        _title() ,
        SizedBox(height: 20.h,),
        CustomInput(isRequired : true ,inputController: usernameController, label: 'Username') ,
        SizedBox(height: 20.h,),
        CustomInput(isRequired: true , inputController: emailController, label: 'Email Address'),
        SizedBox(height: 20.h,),
        CustomCoupleButton(rightButtonText: 'Submit', leftButtonText: 'Cancel' , rightOnTab: (){
          if(formKey.currentState!.validate()){

          }
        },leftOnTab: (){
          Navigator.of(context).pop();
        }, )

      ],),
    );
  }

  Widget _title() {
    return Row(
     children: const [
       CustomTitle(text: 'Forgot your password'),
       
       
     ],
   );
  }

}
