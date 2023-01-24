part of 'theme_switcher_bloc.dart';

abstract class ThemeSwitcherEvent extends Equatable {
  const ThemeSwitcherEvent();
}


class SwitchThemeEvent extends ThemeSwitcherEvent{
 const SwitchThemeEvent();
  @override
  List<Object?> get props => [];
}

class GetThemeModeEvent extends ThemeSwitcherEvent{
  const GetThemeModeEvent();
  @override
  List<Object?> get props => [];

}




