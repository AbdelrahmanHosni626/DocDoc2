import 'package:docdoc2/core/helpers/extensions.dart';
import 'package:docdoc2/core/routing/routes.dart';
import 'package:docdoc2/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyles.font13DarkBlueRegular,
        ),
        TextButton(
          onPressed: ()
          {
            context.pushNamed(Routes.loginScreen);
          },
          child: Text(
            'Login',
            style: TextStyles.font13BlueSemiBold,
          ),
        ),
      ],
    );
  }
}
