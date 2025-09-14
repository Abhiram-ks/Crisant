import 'dart:developer';

import 'package:crisent_pannel/core/common/custom_snackbar.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:flutter/cupertino.dart';



void handleNetworkState(BuildContext context, NetworkState state, bool lisern) {
  log('current state is : $state');
  if (state is NetworkGood) {

  }else if (state is NetworkBad) {
     CustomSnackBar.show(
  context,
  message: 'Internet connection lost!',
  backgroundColor: AppPalette.redColor,
  textAlign: TextAlign.center,
  durationSeconds: 4
);

  }
}