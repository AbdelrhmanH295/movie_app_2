import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_styles.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  Color ? colorBorderSide;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  OnValidator validator;
  TextEditingController ? controller;
  TextInputType keyBoardType;
  bool obsecureText;
  int? maxLines;

  CustomTextFormField({
    super.key,
     required this.colorBorderSide,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.maxLines,
    this.controller,
    this.keyBoardType = TextInputType.text,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return TextFormField(
      style: TextStyle(color: Theme.of(context).canvasColor),
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        
        enabledBorder: buildDecorationBorder(
          colorBorderSide: colorBorderSide,
        ),
        focusedBorder: buildDecorationBorder(
          colorBorderSide: colorBorderSide,
        ),
        errorBorder: buildDecorationBorder(colorBorderSide: AppColors.redColor),
        focusedErrorBorder: buildDecorationBorder(
          colorBorderSide: AppColors.redColor,
        ),
        errorStyle: AppStyles.regular16White.copyWith(
          color: AppColors.redColor,
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.regular16White,
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.regular16White,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: obsecureText,
    );
  }

  OutlineInputBorder buildDecorationBorder({required colorBorderSide}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: colorBorderSide, width: 1),
    );
  }
}
