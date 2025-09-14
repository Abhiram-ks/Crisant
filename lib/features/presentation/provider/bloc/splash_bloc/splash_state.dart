part of 'splash_bloc.dart';

@immutable
abstract class SplashBlocState {}

final class SplashBlocInitial extends SplashBlocState {}

final class SplashBlocGoToLogin extends SplashBlocState {}
final class SplashBlocGoToDashBord extends SplashBlocState {}
