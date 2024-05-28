import 'package:docdoc2/features/register/ui/widgets/already_have_an_account.dart';
import 'package:docdoc2/features/register/ui/widgets/register_bloc_listener.dart';
import 'package:docdoc2/features/register/ui/widgets/register_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                    'Create Account',
                    style: TextStyles.font24BlueBold,
                  ),
                  verticalSpace(8),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: TextStyles.font14GreyRegular,
                  ),
                  verticalSpace(36),
                  const RegisterFormField(),
                  verticalSpace(20),
                  const AlreadyHaveAccountText(),
                  const RegisterBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
