import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:new_panel/core/constants/app_enum.dart';
import 'package:new_panel/core/sharePref/share_pref.dart';

part 'theme_switcher_event.dart';
part 'theme_switcher_state.dart';

class ThemeSwitcherBloc extends Bloc<ThemeSwitcherEvent, ThemeSwitcherState> {
  ThemeSwitcherBloc() : super(ThemeSwitcherInitial()) {
    ThemeMode appTheme = ThemeMode.light;
    bool isDark = false;


    on<SwitchThemeEvent>((event, emit) {
      if(!isDark){
        appTheme = ThemeMode.dark;
        isDark = true;
        SharePref.saveBool("isDark", isDark);
      }else{
        appTheme = ThemeMode.light;
        isDark = false;
        SharePref.saveBool("isDark", isDark);
      }

      emit(AppThemeSwitchState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
    });


    on<GetThemeModeEvent>((event , emit) async{
       isDark = await SharePref.getBool("isDark");
      emit(AppThemeSwitchState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
    });


  }
}
