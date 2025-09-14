import 'package:crisent_pannel/core/common/custom_imageshow.dart';
import 'package:crisent_pannel/core/constant/app_images.dart';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/fetch_person_bloc/fetch_person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBarDashbord extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final int notificationCount;
  final VoidCallback? onBack;
  final VoidCallback? onNotificationTap;

  @override
  final Size preferredSize;

  const CustomAppBarDashbord({
    super.key,
    this.title = 'Dashboard',
    this.notificationCount = 4,
    this.onBack,
    this.onNotificationTap,
  }) : preferredSize = const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFEAF4F4),
      elevation: 4,
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppPalette.blackColor,
        ),
      ),
      leading:
          onBack != null
              ? IconButton.filled(
                tooltip: 'Back',
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const CircleBorder(),
                ),
              )
              : null,
      actions: [
        IconButton.filled(
          icon: const Icon(
            Icons.person_add_alt_1_rounded,
            color: AppPalette.blackColor,
          ),
          onPressed: onNotificationTap,
          tooltip: 'Add user',
          style: IconButton.styleFrom(
            backgroundColor: AppPalette.whiteColor,
            disabledBackgroundColor: AppPalette.whiteColor,
            shadowColor: Colors.black26,
            shape: const CircleBorder(),
          ),
        ),
        ConstantWidgets.width20(context),

        BlocBuilder<FetchPersonBloc, FetchPersonState>(
          builder: (context, state) {
            if (state is PersonLoaded) {
              return SizedBox(
                width: 40,
                height: 40,
                child: ClipOval(
                  child: imageshow(
                    imageUrl: state.person.image,
                    imageAsset: AppImages.appLogo,
                  ),
                ),
              );
            }
            return CircleAvatar(
              backgroundColor: AppPalette.whiteColor,
              radius: 20,
              backgroundImage: AssetImage(AppImages.appLogo),
            );
          },
        ),

        ConstantWidgets.width40(context),
      ],
    );
  }
}
