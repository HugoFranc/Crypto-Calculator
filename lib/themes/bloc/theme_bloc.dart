import 'package:bloc/bloc.dart';
import 'package:crypto_app/themes/themes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: appThemeData[AppThemes.darkTheme]!)) {
    on<ThemeEvent>((event, emit) {
      if(event is ThemeChangedEvent){
        emit.call(ThemeState(themeData: appThemeData[event.theme]!));
      }
    });
  }
}