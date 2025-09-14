
import 'package:crisent_pannel/core/common/custom_snackbar.dart';
import 'package:crisent_pannel/core/routes/app_routes.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:flutter/cupertino.dart';

void handleNetworkState(BuildContext context, NetworkState state, bool lisern,[bool lisern2 = true]) {
  if (state is NetworkGood) {
    if (lisern) {
      Navigator.maybePop(context);
    }
  } else if (state is NetworkBad) {
    if (lisern && lisern2) {
      Navigator.pushNamed(context, AppRoutes.networkfail);
    }
    CustomSnackBar.show(
      context,
      message: 'Internet connection lost!',
      backgroundColor: AppPalette.redColor,
      textAlign: TextAlign.center,
      durationSeconds: 4,
    );
  }
}
