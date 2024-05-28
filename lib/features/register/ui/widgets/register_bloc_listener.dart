import 'package:docdoc2/core/helpers/extensions.dart';
import 'package:docdoc2/core/routing/routes.dart';
import 'package:docdoc2/core/theming/styles.dart';
import 'package:docdoc2/core/widgets/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/register_cubit.dart';
import '../../logic/register_state.dart';


class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
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
            context.pushNamed(Routes.homeScreen);
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
