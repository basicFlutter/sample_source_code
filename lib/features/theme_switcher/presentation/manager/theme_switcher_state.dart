part of 'theme_switcher_bloc.dart';

abstract class ThemeSwitcherState extends Equatable {
  const ThemeSwitcherState();
}

class ThemeSwitcherInitial extends ThemeSwitcherState {
  @override
  List<Object> get props => [];
}

class AppThemeSwitchState extends ThemeSwitcherState{
  final ThemeMode themeMode;
 const AppThemeSwitchState({required this.themeMode});

 @override
  List<Object?> get props => [themeMode];

}
