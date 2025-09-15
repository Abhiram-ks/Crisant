
import 'package:crisent_pannel/core/common/custom_button.dart';
import 'package:crisent_pannel/core/common/custom_snackbar.dart';
import 'package:crisent_pannel/core/common/custom_textfiled.dart';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/core/validation/validate_helper.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/details_bloc/details_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:crisent_pannel/features/presentation/screens/specification_screen.dart';
import 'package:crisent_pannel/features/presentation/widgets/specific_widget/hanlde_delete_state.dart';
import 'package:crisent_pannel/features/presentation/widgets/specific_widget/update_body_widget.dart';
import 'package:crisent_pannel/features/presentation/widgets/specific_widget/update_imagewidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCredentialsWidget extends StatelessWidget {
  const UpdateCredentialsWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.image,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController emailNameController,
    required this.widget,
  }) : _formKey = formKey,
       _firstNameController = firstNameController,
       _lastNameController = lastNameController,
       _emailNameController = emailNameController;

  final GlobalKey<FormState> _formKey;
  final String? image;
  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  final TextEditingController _emailNameController;
  final SpecificationBody widget;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpdateImageWIdget(image: image ?? ''),
          CustomTextedit(
            label: 'First Name *',
            controller: _firstNameController,
            prefixIcon: Icons.person,
            hintText: 'What’s your first name?',
            validate: ValidatorHelper.usernameValidator,
          ),
          ConstantWidgets.hight10(context),
          CustomTextedit(
            label: 'Last Name *',
            controller: _lastNameController,
            prefixIcon: Icons.person,
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
          CustomButton(
            text: 'Update User',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                final imageState = context.read<ImagePickerBloc>().state;
                if (imageState is ImagePickerSuccess) {
                  final imagePath = imageState.imagePath;
                } else {
                  CustomSnackBar.show(
                    context,
                    message: "Please select an image!",
                    backgroundColor: AppPalette.redColor,
                    textAlign: TextAlign.center,
                  );
                }
              }
            },
          ),
          ConstantWidgets.hight20(context),
          BlocListener<DetailsBloc, DetailsState>(
            listener: (context, deleteState) {
              deleteStatehandle(context, deleteState);
            },
            child: CustomButton(
              text: 'Delete',
              bgColor: AppPalette.redColor,
              onPressed: () {
                context.read<DetailsBloc>().add(DeleteRequest(id: widget.uid));
              },
            ),
          ),
        ],
      ),
    );
  }
}
