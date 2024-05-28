import 'package:docdoc2/core/helpers/extensions.dart';
import 'package:docdoc2/core/routing/routes.dart';
import 'package:docdoc2/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account yet?',
          style: TextStyles.font13DarkBlueRegular,
        ),
        TextButton(
          onPressed: ()
          {
            context.pushNamed(Routes.registerScreen);
          },
          child: Text(
            'Sign Up',
            style: TextStyles.font13BlueSemiBold,
          ),
        ),
      ],
    );
  }
}
