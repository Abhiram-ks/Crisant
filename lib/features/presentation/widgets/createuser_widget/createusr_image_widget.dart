
import 'dart:io';

import 'package:crisent_pannel/core/constant/app_images.dart';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateUserImageWidget extends StatelessWidget {
  const CreateUserImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create An Account",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        ConstantWidgets.hight10(context),
        Text(
          "Please enter your details to complete your account creation process.",
        ),
        ConstantWidgets.hight50(context),
        Center(
              child:  InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(
                    PickImageAction(),
                  );
                },
                borderRadius: BorderRadius.circular(100),
                child: BlocBuilder<
                  ImagePickerBloc,
                  ImagePickerState
                >(
                  builder: (context, state) {
                    double size = 80;
                    if (state is ImagePickerSuccess) {
                      return ClipOval(
                        child: Image.file(
                          File(state.imagePath),
                          width: size,
                          height: size,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else if (state is ImagePickerError) {
                      return Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          color: AppPalette.hintColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          CupertinoIcons
                              .photo_fill_on_rectangle_fill,
                          size: 35,
                          color: AppPalette.greyColor,
                        ),
                      );
                    }
                    return Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppPalette.hintColor,
                        ),
                        color: AppPalette.hintColor,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppImages.appLogo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              )
        ),
        ConstantWidgets.hight20(context),
      ],
    );
  }
}
