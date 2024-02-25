part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool enabled;
  const ThemeState({this.enabled = false});

  @override
  List<Object> get props => [enabled];

  @override
  String toString() => 'ThemeState(enabled: $enabled)';

  factory ThemeState.initial() {
    return const ThemeState();
  }

  ThemeState copyWith({bool? enabled}) {
    return ThemeState(enabled: enabled ?? this.enabled);
  }
}
