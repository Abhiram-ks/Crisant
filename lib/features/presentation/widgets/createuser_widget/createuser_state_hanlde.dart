import 'dart:developer';

import 'package:crisent_pannel/core/common/custom_snackbar.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/createuser_bloc/createuser_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/cubit/progresser_cubit/progresser_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/app_colors.dart';

void handleCreateUserState(BuildContext context, CreateuserState state) {
  log('user current state is : $state');
  final progresser = context.read<ProgresserCubit>();
  if (state is ShowInformationAlert) {
    showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: Text('Section Information'),
            content: Text(
              'You are ready to proceed with the process. Once it is submitted, there will be no option to monitor the request.',
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
                  'Proced',
                  style: TextStyle(color: AppPalette.orengeColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  context.read<CreateuserBloc>().add(CreateUserProced());
                },
              ),
            ],
          ),
    );
  } else if (state is CrateUSerFailureState) {
    progresser.stopLoading();
    CustomSnackBar.show(
      context,
      message: 'Create Account Failure! ${state.error}',
      backgroundColor: AppPalette.redColor,
      textAlign: TextAlign.center,
      durationSeconds: 4,
    );
  } else if (state is CreateUSerSuccessState) {
    progresser.stopLoading();
    Navigator.pop(context);
       CustomSnackBar.show(
      context,
      message: 'Create An Account Success!',
      backgroundColor: AppPalette.redColor,
      textAlign: TextAlign.center,
      durationSeconds: 4,
    );
  } else if (state is CreateUserloaidngState) {
    progresser.startLoading();
  }
}
