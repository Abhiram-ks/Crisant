

import 'package:crisent_pannel/core/cloudinary/cloudinary_servide.dart';
import 'package:crisent_pannel/core/common/custom_appbar.dart';
import 'package:crisent_pannel/core/network/connectivity.dart';
import 'package:crisent_pannel/core/service/api_service.dart';
import 'package:crisent_pannel/features/data/datasource/createuser_remote_datasource.dart';
import 'package:crisent_pannel/features/data/repo/create_user_repo_impl.dart';
import 'package:crisent_pannel/features/data/repo/image_picker_repo.dart';
import 'package:crisent_pannel/features/domain/usecase/imagepicker_usecase.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/createuser_bloc/createuser_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/cubit/progresser_cubit/progresser_cubit.dart';
import 'package:crisent_pannel/features/presentation/widgets/createuser_widget/crateuser_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CreateuserScreen extends StatelessWidget {
  const CreateuserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NetworkBloc(NetWorkChecker())),
        BlocProvider(create: (context) => ProgresserCubit()),

        BlocProvider(
          create:
              (context) => ImagePickerBloc(
                PickImageUseCase(ImagePickerRepositoryImpl(ImagePicker())),
              ),
        ),
        BlocProvider(
          create:
              (context) => CreateuserBloc(
                CloudinaryService(),
                CreateuserRepositoryImpl(
                  remoteDatasource: CreateuserRemoteDatasource(
                    apiClient: ApiClient(),
                  ),
                ),
              ),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          return Scaffold(
            appBar: CustomAppBar(),
            body: SafeArea(
              child: AddUserBodyWidget(
                screenWidgth: screenWidth,
                screenHight: screenHeight,
              ),
            ),
          );
        },
      ),
    );
  }
}
