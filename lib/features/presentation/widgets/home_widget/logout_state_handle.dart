
import 'package:crisent_pannel/core/common/custom_snackbar.dart';
import 'package:crisent_pannel/core/routes/app_routes.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/logout_bloc/logout_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void handleCreateLoagOutState(BuildContext context, LogoutState state) {
 
  if (state is LogoutConfirmation) {
    showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: Text('Section Information'),
            content: Text(
              'Are you sure you want to logout?'

            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: AppPalette.blackColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text(
                   "Yes' logout",
                  style: TextStyle(color: AppPalette.orengeColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  context.read<LogoutBloc>().add(LogoutResponseEvent());

                },
              ),
            ],
          ),
    );
  } else if (state is LogoutFailure) {
    CustomSnackBar.show(
      context,
      message: 'Logout Failure!. Please try again',
      backgroundColor: AppPalette.redColor,
      textAlign: TextAlign.center,
      durationSeconds: 4,
    );
  } else if (state is LogoutSuccess) {
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login,(route) => false,);
  } 
}

