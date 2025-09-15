

import 'package:crisent_pannel/core/common/custom_connectivity_state.dart';
import 'package:crisent_pannel/core/constant/app_images.dart';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart' show AppPalette;
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/single_user/single_user_bloc.dart';
import 'package:crisent_pannel/features/presentation/widgets/specific_widget/update_credential_widget.dart';
import 'package:crisent_pannel/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecificationBody extends StatefulWidget {
  final double screenWidgth;
  final double screenHight;
  final int uid;
  const SpecificationBody({
    super.key,
    required this.screenWidgth,
    required this.screenHight,
    required this.uid,
  });

  @override
  State<SpecificationBody> createState() => _SpecificationBodyState();
}

class _SpecificationBodyState extends State<SpecificationBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailNameController = TextEditingController();
  String? image = '';

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, status) {
        handleNetworkState(context, status, true);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.screenWidgth * 0.06,
            ),
            child: BlocConsumer<SingleUserBloc, SingleUserState>(
              listener: (context, state) {
                if (state is SingleUserLoaded) {
                  _firstNameController.text = state.user.firstName;
                  _lastNameController.text = state.user.lastName;
                  _emailNameController.text = state.user.email;
                  image = state.user.avatar;
                }
              },
              builder: (context, state) {
                if (state is SingleUserLoading) {
                   return Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 13,
                                height: 13,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppPalette.orengeColor,
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              ConstantWidgets.width40(context),
                              Text(
                                AppLocalizations.of(context)?.loading ??
                                    "Loading...",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                } else if (state is SingleUserError) {
                   return Center(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.appLogo,
                                height: widget.screenHight * 0.1,
                                fit: BoxFit.contain,
                              ),
                              ConstantWidgets.hight30(context),

                              Text(
                                AppLocalizations.of(context)?.troubleText ?? "Trouble to Proceed!",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: AppPalette.blackColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              ConstantWidgets.hight10(context),

                              Text(
                                AppLocalizations.of(context)?.troubleDescription ??  "We're happy to have you here! Crisant is your trusted platform. Trouble processing your request — please try again later. ",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  color: AppPalette.blackColor,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                }

                return UpdateCredentialsWidget(
                  formKey: _formKey,
                  image: image,
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  emailNameController: _emailNameController,
                  widget: widget,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
