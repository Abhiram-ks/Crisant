import 'package:crisent_pannel/features/presentation/provider/bloc/splash_bloc/splash_bloc.dart';
import 'package:crisent_pannel/features/presentation/widgets/splash_widget/splash_body_widget.dart';
import 'package:crisent_pannel/features/presentation/widgets/splash_widget/splash_statehandle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context) => SplashBloc()..add(SplashEventRequest()),
      child: BlocListener<SplashBloc, SplashBlocState>(
        listener: (context, state) {
          splashStateHandle(context, state);
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;

            return Scaffold(
              body: SplashScreenBody(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            );
          },
        ),
      ),
    );
  }
}
