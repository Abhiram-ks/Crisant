
import 'package:crisent_pannel/core/network/connectivity.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:crisent_pannel/features/presentation/widgets/login_widget/login_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkBloc(NetWorkChecker()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 245, 245, 245),
            resizeToAvoidBottomInset: false,
            body: LoginBodyWidget(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          );
        },
      ),
    );
  }
}
