
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

Image imageshow({required String imageUrl,required String imageAsset}) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
         loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) {
        return child;
      }

   
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: AppPalette.whiteColor,
          color: AppPalette.buttonColor,
        ),
        
      );
    },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          imageAsset,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        );
      },
    );
  }