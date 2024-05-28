import 'package:docdoc2/core/helpers/extensions.dart';
import 'package:docdoc2/features/register/data/models/register_request_body.dart';
import 'package:docdoc2/features/register/logic/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import 'password_validations.dart';

class RegisterFormField extends StatefulWidget {
  const RegisterFormField({super.key});

  @override
  State<RegisterFormField> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<RegisterFormField> {
  bool isObscureText = true;
  bool isObscureTextConfirmed = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<RegisterCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<RegisterCubit>().nameController,
            isObSecureText: false,
            keyboardType: TextInputType.name,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Phone Number',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<RegisterCubit>().phoneController,
            isObSecureText: false,
            keyboardType: TextInputType.phone,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<RegisterCubit>().emailController,
            isObSecureText: false,
            keyboardType: TextInputType.emailAddress,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
            hintText: 'Password',
            isObSecureText: isObscureText,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<RegisterCubit>().confirmPassword,
            hintText: 'Confirm Password',
            isObSecureText: isObscureTextConfirmed,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureTextConfirmed = !isObscureTextConfirmed;
                });
              },
              child: Icon(
                isObscureTextConfirmed ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty || value != passwordController.text) {
                return 'Passwords do not match';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
            hasSpecialCharacter: hasSpecialCharacters,
          ),
          verticalSpace(32),
          AppTextButton(
            borderRadius: 16,
            buttonText: 'Create Account',
            onPressed: () {
              validateThenLogin(context);

            },
          ),
        ],
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterStates(
            RegisterRequestBody(
              name: context.read<RegisterCubit>().nameController.text,
              email: context.read<RegisterCubit>().emailController.text,
              phone: context.read<RegisterCubit>().phoneController.text,
              gender: 0,
              password: context.read<RegisterCubit>().passwordController.text,
              confirmPassword: context.read<RegisterCubit>().confirmPassword.text,
            ),
          );
      context.pushNamed(Routes.loginScreen);
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
