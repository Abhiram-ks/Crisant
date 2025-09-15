import 'package:crisent_pannel/core/common/custom_snackbar.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/details_bloc/details_bloc.dart';
import 'package:flutter/material.dart';

void deleteStatehandle(BuildContext context, DetailsState state) {
  if (state is DeleteSuccess) {
   Navigator.pop(context);
       CustomSnackBar.show(
      context,
      message: 'User has been removed.!',
      backgroundColor: AppPalette.orengeColor,
      textAlign: TextAlign.center,
      durationSeconds: 4,
    );
  }else if (state is DeleteFailure){
           CustomSnackBar.show(
      context,
      message: "Unable to process request.",
      backgroundColor: AppPalette.redColor,
      textAlign: TextAlign.center,
      durationSeconds: 4,
    );
  }
}
