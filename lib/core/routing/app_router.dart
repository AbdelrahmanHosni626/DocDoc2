import 'package:docdoc2/core/di/dependency_injection.dart';
import 'package:docdoc2/core/routing/routes.dart';
import 'package:docdoc2/features/Appointment/ui/appointment_screen.dart';
import 'package:docdoc2/features/Chat/ui/chat_screen.dart';
import 'package:docdoc2/features/bottom_nav_bar/ui/bottom_nav_bar_screen.dart';
import 'package:docdoc2/features/home/ui/home_screen.dart';
import 'package:docdoc2/features/login/data/repos/login_repo.dart';
import 'package:docdoc2/features/login/ui/login_screen.dart';
import 'package:docdoc2/features/profile/ui/profile_screen.dart';
import 'package:docdoc2/features/register/logic/register_cubit.dart';
import 'package:docdoc2/features/search/ui/search_screen.dart';
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

      case Routes.bottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.chatScreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());

      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case Routes.appointmentScreen:
        return MaterialPageRoute(builder: (_) => const AppointmentScreen());

      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

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
