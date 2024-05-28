import 'package:docdoc2/core/di/dependency_injection.dart';
import 'package:docdoc2/core/routing/routes.dart';
import 'package:docdoc2/features/home/ui/home_screen.dart';
import 'package:docdoc2/features/login/data/repos/login_repo.dart';
import 'package:docdoc2/features/login/ui/login_screen.dart';
import 'package:docdoc2/features/register/logic/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/on_bording/on_bording_screen.dart';
import '../../features/register/data/repos/register_repo.dart';
import '../../features/register/ui/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(getIt<LoginRepoImpl>()),
                  child: const LoginScreen(),
                ));

      case Routes.registerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterCubit(getIt<RegisterRepoImpl>()),
                  child: const RegisterScreen(),
                ));

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No Route Defined For ${settings.name}'),
            ),
          ),
        );
    }
  }
}
