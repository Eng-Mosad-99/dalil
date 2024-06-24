import 'package:dalil/core/database/cache/cache_helper.dart';
import 'package:dalil/core/utils/app_strings.dart';
import 'package:dalil/core/utils/app_text_styles.dart';
import 'package:dalil/core/widgets/custom_btn.dart';
import 'package:dalil/core/widgets/custom_navigate.dart';
import 'package:dalil/features/on_boarding/data/model/on_boarding_model.dart';
import 'package:dalil/features/on_boarding/presentation/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_navbar.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomNavBar(
                onTap: () {
                  CacheHelper().saveData(key: 'isOnBoardingShown', value: true);
                  customNavigate(context, '/signUp');
                },
              ),
              OnBoardingBody(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              const SizedBox(
                height: 40,
              ),
              currentIndex == onBoardingData.length - 1
                  ? Column(
                      children: [
                        CustomButton(
                          text: AppStrings.createAccount,
                          onPressed: () {
                            customNavigate(context, '/signUp');
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          AppStrings.signIn,
                          style: CustomTextStyles.poppins300style16.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )
                  : CustomButton(
                      text: AppStrings.next,
                      onPressed: () {
                        _controller.nextPage(
                          duration: const Duration(microseconds: 200),
                          curve: Curves.bounceIn,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
