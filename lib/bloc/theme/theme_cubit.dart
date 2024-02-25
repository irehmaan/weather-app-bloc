import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void enableDarkTheme(bool enabled) {
    if (enabled) {
      emit(state.copyWith(enabled: true));
    } else {
      emit(state.copyWith(enabled: false));
    }
  }
}
