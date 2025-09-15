
import 'package:crisent_pannel/core/common/custom_appbar.dart';
import 'package:crisent_pannel/core/network/connectivity.dart';
import 'package:crisent_pannel/core/service/api_service.dart';
import 'package:crisent_pannel/features/data/datasource/delete_user_remote_datasource.dart';
import 'package:crisent_pannel/features/data/datasource/singleuser_remote_datasource.dart';
import 'package:crisent_pannel/features/data/repo/image_picker_repo.dart';
import 'package:crisent_pannel/features/domain/usecase/imagepicker_usecase.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/details_bloc/details_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/single_user/single_user_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/cubit/progresser_cubit/progresser_cubit.dart';
import 'package:crisent_pannel/features/presentation/widgets/specific_widget/update_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SpecificationScreen extends StatelessWidget {
  final int uid;
  const SpecificationScreen({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NetworkBloc(NetWorkChecker())),
        BlocProvider(create: (context) => ProgresserCubit()),
        BlocProvider(
          create:
              (context) => DetailsBloc(
                DeleteUserRemoteDatasource(apiClient: ApiClient()),
              ),
        ),
        BlocProvider(
          create:
              (context) => ImagePickerBloc(
                PickImageUseCase(ImagePickerRepositoryImpl(ImagePicker())),
              ),
        ),
        BlocProvider(
          create:
              (context) => SingleUserBloc(
                remoteDataSource: SingleUserRemoteDataSource(
                  apiClient: ApiClient(),
                ),
              )..add(FetchUserByIdEvent(uid.toString())),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;

            return SafeArea(
              child: SpecificationBody(
                screenWidgth: screenWidth,
                screenHight: screenHeight,
                uid: uid,
              ),
            );
          },
        ),
      ),
    );
  }
}