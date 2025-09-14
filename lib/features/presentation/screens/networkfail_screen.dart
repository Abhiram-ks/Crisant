
import 'package:crisent_pannel/core/common/custom_failurebody.dart';
import 'package:crisent_pannel/core/network/connectivity.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkFailScreen extends StatelessWidget {
  const NetworkFailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkBloc(NetWorkChecker()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppPalette.redColor,
              elevation: 4,
              centerTitle: false,
            ),
            body: SafeArea(child: NetworkfailureBody(screenWidth: screenWidth)),
          );
        },
      ),
    );
  }
}
