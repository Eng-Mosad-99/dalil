// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.lblText,
      this.onChanged,
      this.onFieldSubmitted,
      this.obscureText,
      this.suffixIcon});
  final String lblText;
  final void Function(String)? onChanged, onFieldSubmitted;
  final Widget? suffixIcon;
  bool? obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 24),
      child: TextFormField(
        obscureText: obscureText ?? false,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          labelText: lblText,
          suffixIcon: suffixIcon,
          labelStyle: CustomTextStyles.poppins500style18,
          enabledBorder: getBorderStyle(),
          focusedBorder: getBorderStyle(),
          border: getBorderStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder getBorderStyle() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: AppColors.grey,
      ));
}
