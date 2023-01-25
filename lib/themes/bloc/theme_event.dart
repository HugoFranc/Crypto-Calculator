part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

}

class ThemeChangedEvent extends ThemeEvent{

  final AppThemes theme;

  ThemeChangedEvent({
    required this.theme
  });

  @override
  List<Object> get props => [theme];
}