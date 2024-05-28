import 'package:docdoc2/core/theming/colors.dart';
import 'package:docdoc2/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:docdoc2/core/helpers/extensions.dart';
import 'package:docdoc2/core/routing/routes.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 52),
        ),
      ),
      onPressed: ()
      {
        context.pushNamed(Routes.loginScreen);
      },
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
