
import 'package:crisent_pannel/core/common/custom_imageshow.dart';
import 'package:crisent_pannel/core/constant/app_images.dart';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/fetch_person_bloc/fetch_person_bloc.dart';
import 'package:crisent_pannel/l10n/app_localizations.dart' show AppLocalizations;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchPersonBuilWidget extends StatelessWidget {
  const FetchPersonBuilWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPersonBloc, FetchPersonState>(
      builder: (context, state) {
        if (state is PersonLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Please wait at the moment',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ],
          );
        } else if (state is PersonLoaded) {
          final model = state.person;
          return Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  width: 50, 
                  height: 50,
                  child: ClipOval(
                    child: imageshow(
                      imageUrl: model.image,
                      imageAsset: AppImages.appLogo,
                    ),
                  ),
                ),
    
                ConstantWidgets.width20(context),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.userName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        model.email,
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppPalette.whiteColor,
                radius: 20,
                backgroundImage: AssetImage(AppImages.appLogo),
              ),
              ConstantWidgets.width20(context),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)?.appTitle ??
                          'Crisant',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "Please try to login",
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
