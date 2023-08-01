import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_theme.dart';
import 'package:new_panel/core/data/network/api_provider.dart';

import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/suggestions/presentation/manager/suggestion_bloc.dart';
import 'package:new_panel/features/login_feature/presentation/pages/login_page.dart';
import 'package:new_panel/features/splash_feature/presentation/pages/splash_page.dart';
import 'package:new_panel/features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';


Logger logger = Logger();

void main() async{
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
    return MultiBlocProvider(

      providers: [
        BlocProvider<ThemeSwitcherBloc>(
          create: (context) => locator<ThemeSwitcherBloc>()..add(const GetThemeModeEvent()),),

        BlocProvider<SuggestionsBloc>(
          create: (context) => SuggestionsBloc(suggestionsUseCase: locator()),)
      ],
      child: ScreenUtilInit(

        designSize: const Size(390, (850+33.5)),
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,

        builder: (context, child) {
          return BlocConsumer<ThemeSwitcherBloc, ThemeSwitcherState>(
            listener: (context , state){
              if(state is AppThemeSwitchState){
                themeMode = state.themeMode;
              }
            },
            builder: (context, state) {

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: Style.lightTheme,
                darkTheme: Style.darkTheme,
                themeMode: themeMode,
                home: child,
              );
            },
          );
        },
        // child:   const MainPage(),
        child:  const SplashScreen()
        // child:    DashboardCustomerPage(),
      ),
    );
  }
}