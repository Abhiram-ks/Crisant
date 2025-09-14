
import 'package:crisent_pannel/core/constant/app_images.dart';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginDetailsWidget extends StatelessWidget {
  final double screenWidth;

  const LoginDetailsWidget({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.appLogo, width: screenWidth * 0.30),
        Text(
          AppLocalizations.of(context)?.appTitle ?? 'Crisant',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1.5,
            color: AppPalette.blackColor,
          ),
        ),
        Text(
          AppLocalizations.of(context)?.appDescription ??
              "With our unique combination of technology and creativity, we help take your business to the next level.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 14, color: AppPalette.greyColor),
        ),
        ConstantWidgets.hight30(context),
         Text(
           AppLocalizations.of(context)?.welcomback ?? "Welcome Back!",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        ConstantWidgets.hight10(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock_clock_outlined,
              size: 18,
              color: AppPalette.buttonColor,
            ),
            ConstantWidgets.width20(context),
            GestureDetector(
              onTap: () {},
              child:  Text(
               AppLocalizations.of(context)?.googleSignIn ?? "Sign up with Google",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppPalette.buttonColor,
                ),
              ),
            ),
          ],
        ),
        ConstantWidgets.hight20(context),
      ],
    );
  }
}
