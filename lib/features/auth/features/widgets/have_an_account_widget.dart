import 'package:dalil/core/utils/app_colors.dart';
import 'package:dalil/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget(
      {super.key, required this.textOne, required this.textTwo, this.onTap});
  final String textOne, textTwo;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: textOne,
                style: CustomTextStyles.poppins400style12,
              ),
              TextSpan(
                text: textTwo,
                style: CustomTextStyles.poppins400style12.copyWith(
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
