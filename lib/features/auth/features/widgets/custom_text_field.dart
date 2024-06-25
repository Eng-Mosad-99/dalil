
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.lblText});
  final String lblText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 24),
      child: TextField(
        decoration: InputDecoration(
          labelText: lblText,
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
      borderSide: BorderSide(
        color: AppColors.grey,
      ));
}
