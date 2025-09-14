import 'package:crisent_pannel/core/network/connectivity.dart';
import 'package:crisent_pannel/features/data/datasource/auth_remot_datasource.dart';
import 'package:crisent_pannel/features/data/repo/auth_repo_impl.dart';
import 'package:crisent_pannel/features/domain/usecase/auth_usecase.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/googlesign_bloc/googlesign_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/cubit/progresser_cubit/progresser_cubit.dart';
import 'package:crisent_pannel/features/presentation/widgets/login_widget/login_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NetworkBloc(NetWorkChecker())),
        BlocProvider(
          create:
              (context) => GooglesignBloc(
                GoogleSignInUsecase(
                  AuthRepositoryImpl(remote: AuthRemoteDataSource()),
                ),
              ),
        ),
          
        BlocProvider(create: (context) => ProgresserCubit()),
       
      ],
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
