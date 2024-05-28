import 'package:docdoc2/core/theming/colors.dart';
import 'package:docdoc2/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final bool isObSecureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    Key? key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    required this.hintText,
    this.hintStyle,
    this.inputTextStyle,
    required this.isObSecureText,
    this.suffixIcon,
    required this.keyboardType,
    this.fillColor,
    this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.mainBlue,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lighterGrey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        hintStyle: hintStyle ?? TextStyles.font14lightGreyMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? ColorsManager.moreLightGrey,
      ),
      obscureText: isObSecureText,
      style: inputTextStyle ?? TextStyles.font14DarkBlueMedium,
      keyboardType: TextInputType.name,
      validator: (value){
        return validator(value);
      },
    );
  }
}
