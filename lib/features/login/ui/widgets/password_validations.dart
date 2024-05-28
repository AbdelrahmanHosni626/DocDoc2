import 'package:docdoc2/core/theming/colors.dart';
import 'package:docdoc2/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;

  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasNumber,
      required this.hasSpecialCharacter,
      required this.hasMinLength,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        buildValidationRow('At Least 1 Lowercase Letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At Least 1 Uppercase Letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow('At Least 1 Number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At Least 1 Special character', hasSpecialCharacter),
        verticalSpace(2),
        buildValidationRow('At Least 8 characters', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5.r,
          backgroundColor: ColorsManager.grey,
        ),
        horizontalSpace(8),
        Text(text, style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough : null,
          decorationThickness: 2,
          decorationColor: Colors.green,
          color: hasValidated ? ColorsManager.grey : ColorsManager.darkBlue,
        ),),
      ],
    );
  }
}
