import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/features/presentation/screens/adduser_screen.dart';
import 'package:crisent_pannel/features/presentation/screens/home_screen.dart';
import 'package:crisent_pannel/features/presentation/screens/login_screen.dart';
import 'package:crisent_pannel/features/presentation/screens/networkfail_screen.dart';
import 'package:crisent_pannel/features/presentation/screens/splash_sceen.dart';
import 'package:flutter/material.dart';
class AppRoutes {
  static const String splash = '/';
  static const String login  = '/login_screen';
  static const String home   = '/home_screen';
  static const String networkfail = '/networkfail_screen';
  static const String adduser = '/adduser_screen';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case networkfail:
         return MaterialPageRoute(builder: (_)=> const NetworkFailScreen());
      case adduser:
      final args = settings.arguments as bool;
        return MaterialPageRoute(builder: (_) =>  AdduserScreen(isView: args));
      default:
        return MaterialPageRoute(
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;

                  return Scaffold(
                    body: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * .04,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Page Not Found',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                           ConstantWidgets.hight20(context),
                            Text(
                              'The page you were looking for could not be found. '
                              'It might have been removed, renamed, or does not exist.',
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(fontSize: 16, height: 1.4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
        );
    }
  }
}
