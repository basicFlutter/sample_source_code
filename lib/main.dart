import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:new_panel/core/constants/app_theme.dart';
import 'package:new_panel/core/data/network/api_provider.dart';
import 'package:new_panel/core/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/features/forgot_pass_feature/presentation/pages/forget_pass_page.dart';
import 'package:new_panel/features/login_feature/presentation/pages/login_page.dart';
import 'package:new_panel/features/main_page_feature/presentation/pages/main_page.dart';
import 'package:new_panel/features/verify_feature/presentation/pages/verify_page.dart';
Logger logger = Logger();
void main() {

  WidgetsFlutterBinding.ensureInitialized();

  serviceLocator();

  ApiProvider().initLogger();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp( MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Style.lightTheme,
          darkTheme: Style.darkTheme,
          themeMode: ThemeMode.light,
          home: child,
        );
      },
      child: const VerifyPage(),
    );
  }
}