import 'package:docdoc2/core/helpers/spacing.dart';
import 'package:docdoc2/core/theming/styles.dart';
import 'package:docdoc2/features/login/ui/widgets/don\'t_have_an_account.dart';
import 'package:docdoc2/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:docdoc2/features/login/ui/widgets/login_form_field.dart';
import 'package:docdoc2/features/login/ui/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(8),
                  Text(
                    'Welcome Back',
                    style: TextStyles.font24BlueBold,
                  ),
                  verticalSpace(8),
                  Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: TextStyles.font14GreyRegular,
                  ),
                  verticalSpace(36),
                  const LoginFormField(),
                  verticalSpace(20),
                  const TermsAndConditions(),
                  verticalSpace(60),
                  const DontHaveAccountText(),
                  const LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
