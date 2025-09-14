
import 'package:crisent_pannel/core/common/custom_connectivity_state.dart';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkfailureBody extends StatefulWidget {
  final double screenWidth;
  const NetworkfailureBody({super.key, required this.screenWidth});

  @override
  State<NetworkfailureBody> createState() => _NetworkfailureBodyState();
}

class _NetworkfailureBodyState extends State<NetworkfailureBody> {
  @override
  void initState() {
    super.initState();
    context.read<NetworkBloc>().add(CheckConnectivity());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) {
        handleNetworkState(context, state, true, false);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * .05),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.wifi_off_outlined,
                size: 100,
                color: AppPalette.hintColor,
              ),
              ConstantWidgets.hight20(context),
              const Text(
                'Connection Lost!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ConstantWidgets.hight10(context),
              const Text(
                'It looks like your device is not connected to the internet. '
                'Please check your Wi-Fi or mobile data settings, ensure you have a stable connection, '
                'and try again. If the problem persists, you may need to restart the app or your device.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8),
              ),
              ConstantWidgets.hight30(context),
              Text(
                'Unable to process your request due to a lost internet connection. '
                'Please try refreshing the screen',
                    textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8),
              ),
              IconButton(
                onPressed: () {
                  context.read<NetworkBloc>().add(CheckConnectivity());
                },
                icon: Icon(
                  Icons.wifi_protected_setup_rounded,
                  color: AppPalette.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
