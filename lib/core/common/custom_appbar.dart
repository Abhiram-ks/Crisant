import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String? title;
  final Color? backgroundColor;
  final bool? isTitle;
  final Color? titleColor;
  final Color? iconColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    this.isTitle = false
  })
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isTitle == true
          ? Text(
              title!,
              style:  TextStyle(
                color:titleColor ?? Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      backgroundColor:backgroundColor ?? AppPalette.whiteColor,
      iconTheme: IconThemeData(color:iconColor ?? AppPalette.blackColor),
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }
}
