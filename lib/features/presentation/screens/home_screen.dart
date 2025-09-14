
import 'package:crisent_pannel/core/network/connectivity.dart';
import 'package:crisent_pannel/core/routes/app_routes.dart';
import 'package:crisent_pannel/core/service/api_service.dart';
import 'package:crisent_pannel/features/data/datasource/person_local_datasource.dart';
import 'package:crisent_pannel/features/data/datasource/user_remote_datasource.dart';
import 'package:crisent_pannel/features/data/repo/user_repo_impl.dart';
import 'package:crisent_pannel/features/domain/usecase/user_usecase.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/fetch_person_bloc/fetch_person_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/user_bloc/user_bloc.dart';
import 'package:crisent_pannel/features/presentation/widgets/home_widget/home_appdrawer.dart';
import 'package:crisent_pannel/features/presentation/widgets/home_widget/home_bodywidget.dart';
import 'package:crisent_pannel/features/presentation/widgets/home_widget/home_customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NetworkBloc(NetWorkChecker())),
        BlocProvider(
          create:
              (context) =>
                  FetchPersonBloc(PersonLocalDatasource())
                    ..add(FetchPersonEventRequest()),
        ),
        BlocProvider(
          create:
              (context) => UserBloc(
                getUsersUseCase: GetUsersUseCase(
                  repository: UserRepositoryImpl(
                    remoteDataSource: UserRemoteDataSource(
                      apiClient: ApiClient(),
                    ),
                  ),
                ),
              ),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenHight = constraints.maxHeight;
          final screenWidth = constraints.maxWidth;
          return Scaffold(
            drawer: AppDrawer(
              screenWidth: screenWidth,
              screenHight: screenHight,
            ),
            appBar: CustomAppBarDashbord(notificationCount: 2,onNotificationTap: () {
              Navigator.pushNamed(context, AppRoutes.adduser,arguments: false);
            },),
            body: DashbordBody(
              screenWidth: screenWidth,
              screenHight: screenHight,
            ),
          );
        },
      ),
    );
  }
}

