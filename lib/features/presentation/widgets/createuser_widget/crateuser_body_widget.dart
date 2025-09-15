
import 'package:crisent_pannel/core/common/custom_button.dart';
import 'package:crisent_pannel/core/common/custom_connectivity_state.dart';
import 'package:crisent_pannel/core/common/custom_snackbar.dart';
import 'package:crisent_pannel/core/common/custom_textfiled.dart';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/core/validation/validate_helper.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/createuser_bloc/createuser_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:crisent_pannel/features/presentation/widgets/createuser_widget/createuser_state_hanlde.dart';
import 'package:crisent_pannel/features/presentation/widgets/createuser_widget/createusr_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserBodyWidget extends StatefulWidget {
  final double screenWidgth;
  final double screenHight;
  const AddUserBodyWidget({
    super.key,
    required this.screenWidgth,
    required this.screenHight,
  });

  @override
  State<AddUserBodyWidget> createState() => _AddUserBodyWidgetState();
}

class _AddUserBodyWidgetState extends State<AddUserBodyWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailNameController = TextEditingController();
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CreateUserImageWidget(),
                  CustomTextedit(
                    label: 'First Name *',
                    controller: _firstNameController,
                    prefixIcon: Icons.person,
                    hintText: 'What’s your first name?',
                    validate: ValidatorHelper.usernameValidator,
                  ),
                  ConstantWidgets.hight10(context),
                  CustomTextedit(
                    label: 'Last name *',
                    controller: _lastNameController,
                    prefixIcon: Icons.person,
                    prefixIconColor: AppPalette.whiteColor,
                    hintText: 'What’s your last name?',
                    validate: ValidatorHelper.usernameValidator,
                  ),
                  ConstantWidgets.hight10(context),
                  CustomTextedit(
                    label: 'Email *',
                    controller: _emailNameController,
                    prefixIcon: Icons.mail_rounded,
                    hintText: "Enter a valid email address",
                    validate: ValidatorHelper.emailValidator,
                  ),
                  ConstantWidgets.hight50(context),
                  BlocListener<CreateuserBloc, CreateuserState>(
                    listener: (context, creteState) {
                      handleCreateUserState(context, creteState);
                    },
                    child: CustomButton(
                      text: 'Create User',
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final imageState =
                              context.read<ImagePickerBloc>().state;
                          if (imageState is ImagePickerSuccess) {
                            final imagePath = imageState.imagePath;
                            context.read<CreateuserBloc>().add(
                              CreateUserRequest(
                                emill: _emailNameController.text.trim(),
                                firstname: _firstNameController.text.trim(),
                                lastname: _lastNameController.text.trim(),
                                image: imagePath,
                              ),
                            );
                          } else {
                            CustomSnackBar.show(
                              context,
                              message: "Please select an image!",
                              backgroundColor: AppPalette.redColor,
                              textAlign: TextAlign.center,
                            );
                          }
                        } else {
                          CustomSnackBar.show(
                            context,
                            message: "Form Validation Failed!",
                            backgroundColor: AppPalette.redColor,
                            textAlign: TextAlign.center,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
