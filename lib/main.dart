
import 'package:crisent_pannel/core/cloudinary/cloudinary_config.dart';
import 'package:crisent_pannel/core/network/permisions.dart';
import 'package:crisent_pannel/core/notification/notification_service.dart';
import 'package:crisent_pannel/core/routes/app_routes.dart';
import 'package:crisent_pannel/core/themes/app_themes.dart';
import 'package:crisent_pannel/features/presentation/provider/cubit/localization_cubit/localization_cubit.dart';
import 'package:crisent_pannel/firebase_options.dart';
import 'package:crisent_pannel/l10n/app_localizations.dart';
import 'package:crisent_pannel/l10n/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await requestNotificationPermission();
  await FirebaseMessaging.instance.requestPermission();
  CloudinaryConfig.initialize();
  await LocalNotificationServices.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalizationCubit()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, String>(
      builder: (context, lan) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Crisant',
          theme: AppTheme.lightTheme,
          supportedLocales: L10n.all,
          locale: Locale(lan),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
