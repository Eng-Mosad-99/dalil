
import 'package:dalil/core/utils/app_strings.dart';
import 'package:dalil/features/auth/features/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: AppStrings.iHaveAgreeToOur,
                style: CustomTextStyles.poppins400style12,
              ),
              TextSpan(
                text: AppStrings.termsAndCondition,
                style: CustomTextStyles.poppins400style12.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
