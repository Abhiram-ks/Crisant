
import 'package:crisent_pannel/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../../provider/bloc/splash_bloc/splash_bloc.dart';

void splashStateHandle(BuildContext context, SplashBlocState state) {
  if (state is SplashBlocGoToLogin) {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }else if (state is SplashBlocGoToDashBord){
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }
}
