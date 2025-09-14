
import 'package:crisent_pannel/core/common/custom_connectivity_state.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:crisent_pannel/features/presentation/widgets/login_widget/login_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBodyWidget extends StatefulWidget {
  const LoginBodyWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  State<LoginBodyWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {

  
  @override
  void initState() {
    super.initState();
    context.read<NetworkBloc>().add(CheckConnectivity());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, status) {
        handleNetworkState(context, status, false);
      },
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: LoginScreenBody(
            screenWidth: widget.screenWidth,
            screenHeight: widget.screenHeight,
          ),
        ),
      ),
    );
  }
}
