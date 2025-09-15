import 'dart:developer';

import 'package:crisent_pannel/core/common/custom_connectivity_state.dart';
import 'package:crisent_pannel/core/common/custom_imageshow.dart';
import 'package:crisent_pannel/core/constant/app_images.dart';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/user_bloc/user_bloc.dart';
import 'package:crisent_pannel/features/presentation/screens/specification_screen.dart';
import 'package:crisent_pannel/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashbordBody extends StatefulWidget {
  const DashbordBody({
    super.key,
    required this.screenWidth,
    required this.screenHight,
  });

  final double screenWidth;
  final double screenHight;

  @override
  State<DashbordBody> createState() => _DashbordBodyState();
}

class _DashbordBodyState extends State<DashbordBody> {
  @override
  void initState() {
    super.initState();
    context.read<NetworkBloc>().add(CheckConnectivity());
    context.read<UserBloc>().add(LoadUsersEvent(page: 1));
  }

  Future<void> _onRefresh(BuildContext context) async {
    final state = context.read<UserBloc>().state;
    int page = 1;
    if (state is UserLoaded) {
      page = state.currentPage;
    }
    context.read<UserBloc>().add(LoadUsersEvent(page: page));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, status) {
        handleNetworkState(context, status, true);
      },
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return RefreshIndicator(
                    backgroundColor: AppPalette.whiteColor,
                    color: AppPalette.orengeColor,
                    onRefresh: () => _onRefresh(context),
                    child: () {
                      if (state is UserLoading) {
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
                      } else if (state is UserLoaded) {
                        return ListView.builder(
                          itemCount: state.users.length,
                          itemBuilder: (context, index) {
                            final user = state.users[index];
                            return InkWell(
                              onTap: () {
                                log('data type : uid : ${user.id}');
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificationScreen(uid: user.id),));
                              },
                              child: ListTile(
                                leading: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: ClipOval(
                                    child: imageshow(
                                      imageUrl: user.avatar,
                                      imageAsset: AppImages.appLogo,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "${user.firstName} ${user.lastName}",
                                  overflow:
                                      TextOverflow
                                          .ellipsis,
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  user.email,
                                  overflow:
                                      TextOverflow
                                          .ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return Center(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: widget.screenWidth * .03,
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
                    }(),
                  );
                },
              ),
            ),

            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                const totalPages = 2;
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(totalPages, (index) {
                      final page = index + 1;
                      return GestureDetector(
                        onTap: () {
                          context.read<UserBloc>().add(
                            LoadUsersEvent(page: page),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                (state is UserLoaded &&
                                        state.currentPage == page)
                                    ? AppPalette.orengeColor
                                    : AppPalette.whiteColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "$page",
                            style: TextStyle(
                              color:
                                  (state is UserLoaded &&
                                          state.currentPage == page)
                                      ? AppPalette.whiteColor
                                      : AppPalette.blackColor,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
