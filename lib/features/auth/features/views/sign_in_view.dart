import 'package:dalil/core/utils/app_strings.dart';
import 'package:dalil/core/widgets/custom_navigate.dart';
import 'package:dalil/features/auth/features/widgets/custom_signIn_form.dart';
import 'package:dalil/features/auth/features/widgets/have_an_account_widget.dart';
import 'package:dalil/features/auth/features/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/welcome_banner.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: WelcomeBanner(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          const SliverToBoxAdapter(
            child: WelcomeTextWidget(
              text: AppStrings.welcomeBack,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomSignInForm(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: HaveAnAccountWidget(
                textOne: AppStrings.dontHaveAnAccount,
                textTwo: AppStrings.signUp,
                onTap: () {
                  customReplacementNavigate(context, '/signUp');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
