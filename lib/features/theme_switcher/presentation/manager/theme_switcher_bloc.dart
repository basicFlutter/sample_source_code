import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/data/cache/cache_provider.dart';

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
        CacheProvider.saveBool("isDark", isDark);
      }else{
        appTheme = ThemeMode.light;
        isDark = false;
        CacheProvider.saveBool("isDark", isDark);
      }

      emit(AppThemeSwitchState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
    });


    on<GetThemeModeEvent>((event , emit) async{
       isDark = await CacheProvider.getBool("isDark");
      emit(AppThemeSwitchState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
    });
    // Theme.of(context).brightness == Brightness.dark TODO THEME


  }
}
