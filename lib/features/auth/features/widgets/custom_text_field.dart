import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.lblText, this.onChanged, this.onFieldSubmitted});
  final String lblText;
  final void Function(String)? onChanged, onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 24),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          }
        },
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
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
      borderSide: const BorderSide(
        color: AppColors.grey,
      ));
}
