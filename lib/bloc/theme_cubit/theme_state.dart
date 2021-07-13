part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  final ThemeData theme;
  const ThemeState({required this.theme});

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  final ThemeData theme;

  ThemeInitial({required this.theme}) : super(theme: theme);
}

class ThemeChanged extends ThemeState {
  final ThemeData theme;
  ThemeChanged({required this.theme}) : super(theme: theme);
}
