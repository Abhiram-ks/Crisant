import 'dart:developer';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/logout_bloc/logout_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/cubit/localization_cubit/localization_cubit.dart';
import 'package:crisent_pannel/features/presentation/screens/createuser_screen.dart';
import 'package:crisent_pannel/features/presentation/widgets/home_widget/home_fetchperson.dart';
import 'package:crisent_pannel/features/presentation/widgets/home_widget/logout_state_handle.dart';
import 'package:crisent_pannel/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  final double screenWidth;
  final double screenHight;

  const AppDrawer({
    super.key,
    required this.screenWidth,
    required this.screenHight,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFEAF4F4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      clipBehavior: Clip.antiAlias,
      width: screenWidth * 0.7,
      child: SafeArea(
        child: Column(
          children: [
            FetchPersonBuilWidget(),

            ConstantWidgets.hight20(context),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.language_rounded),
                    title: Text(
                      AppLocalizations.of(context)?.dashboardLanguage ?? 'Language',
                    ),
                    onTap: () {
                      context.read<LocalizationCubit>().toggleText();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_add_alt_1_rounded),
                    title:  Text( AppLocalizations.of(context)?.addUser ?? 'Add User'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateuserScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  BlocListener<LogoutBloc, LogoutState>(
                    listener: (context, logoutState) {
                      handleCreateLoagOutState(context, logoutState);
                    },
                    child: ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title:  Text(
                         AppLocalizations.of(context)?.logOut ?? 'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {
                        context.read<LogoutBloc>().add(LogoutRequestTrigger());
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Version 1.0.0",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
