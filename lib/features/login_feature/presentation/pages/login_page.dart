import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/service_locator.dart';

import 'package:new_panel/features/login_feature/presentation/widgets/hillz_text.dart';
import 'package:new_panel/features/login_feature/presentation/widgets/login_container.dart';

import '../manager/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => LoginBloc(loginUseCase: locator(), authGoogleUseCase: locator()),
          child: LoginContainer()

      ),
    );
  }
}
