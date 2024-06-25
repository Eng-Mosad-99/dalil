import 'package:dalil/core/utils/app_strings.dart';
import 'package:dalil/core/utils/app_text_styles.dart';
import 'package:dalil/core/widgets/custom_btn.dart';
import 'package:dalil/core/widgets/custom_navigate.dart';
import 'package:dalil/features/on_boarding/data/model/on_boarding_model.dart';
import 'package:dalil/features/on_boarding/presentation/functions/on_boarding.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons({
    super.key,
    required this.currentIndex,
    required this.controller,
  });

  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        currentIndex == onBoardingData.length - 1
            ? Column(
                children: [
                  CustomButton(
                    text: AppStrings.createAccount,
                    onPressed: () {
                      onBoardingVisited();
                      customReplacementNavigate(context, '/signUp');
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      onBoardingVisited();
                      customReplacementNavigate(context, '/signIn');
                    },
                    child: Text(
                      AppStrings.signIn,
                      style: CustomTextStyles.poppins300style16.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )
            : CustomButton(
                text: AppStrings.next,
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(microseconds: 200),
                    curve: Curves.bounceIn,
                  );
                },
              ),
      ],
    );
  }
}
