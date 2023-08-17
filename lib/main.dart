import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_theme.dart';
import 'package:new_panel/core/data/network/api_provider.dart';

import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/suggestions/presentation/manager/suggestion_bloc.dart';

import 'package:new_panel/features/main_page_feature/presentation/pages/main_page.dart';

Logger logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  serviceLocator();

  ApiProvider().initLogger();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await ScreenUtil.ensureScreenSize();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SuggestionsBloc>(
      create: (context) => SuggestionsBloc(suggestionsUseCase: locator()),
      child: ScreenUtilInit(

        designSize: const Size(390, (850 + 33.5)),
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,

        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Style.lightTheme,
            darkTheme: Style.darkTheme,
            themeMode: themeMode,
            home: child,
          );
        },
        child: const MainPage(),
      ),
    );
  }
}