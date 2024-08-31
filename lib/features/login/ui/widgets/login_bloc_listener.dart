import 'package:docdoc2/core/helpers/extensions.dart';
import 'package:docdoc2/core/routing/routes.dart';
import 'package:docdoc2/core/theming/styles.dart';
import 'package:docdoc2/core/widgets/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const AppLoading(),
            );
          },
          success: (data) {
            context.pop;
            context.pushNamed(Routes.bottomNavBarScreen);
          },
          failure: (errMessage) {
            context.pop;
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
                content: Text(
                  errMessage,
                  style: TextStyles.font15DarkBlueMedium,
                ),
                actions: [
                  TextButton(
                    onPressed: (){
                      context.pop;
                    },
                    child: Text('Got it', style: TextStyles.font14BlueSemiBold,),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
