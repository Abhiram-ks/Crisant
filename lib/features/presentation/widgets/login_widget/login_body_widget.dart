import 'package:crisent_pannel/core/constant/app_images.dart';
import 'package:crisent_pannel/features/presentation/widgets/login_widget/login_credential_widget.dart';
import 'package:crisent_pannel/features/presentation/widgets/login_widget/login_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/themes/app_colors.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Lottie.asset(
            AppImages.animation,
            width: screenWidth,
            fit: BoxFit.cover,
            repeat: true,
          ),
        ),
        Center(
          child: Container(
            width: screenWidth * 0.87,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppPalette.whiteColor.withAlpha((0.89 * 255).round()),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppPalette.blackColor.withAlpha((0.1 * 255).round()),
                  blurRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoginDetailsWidget(screenWidth: screenWidth),
                  LoginCredentialPart(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

