part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  final ThemeData theme;
  const ThemeState({this.theme});

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  final ThemeData theme;

  ThemeInitial({this.theme}) : super(theme: theme);
}

class ThemeChanged extends ThemeState {
  final ThemeData theme;
  ThemeChanged({this.theme}) : super(theme: theme);
}
