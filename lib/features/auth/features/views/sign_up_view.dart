import 'package:dalil/core/utils/app_strings.dart';
import 'package:dalil/core/widgets/custom_btn.dart';
import 'package:dalil/features/auth/features/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../widgets/have_an_account_widget.dart';
import '../widgets/terms_and_conditions.dart';
import '../widgets/welcome_text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 80,
              ),
            ),
            const SliverToBoxAdapter(
              child: WelcomeTextWidget(
                text: AppStrings.welcome,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                lblText: AppStrings.fristName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                lblText: AppStrings.lastName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                lblText: AppStrings.emailAddress,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                lblText: AppStrings.password,
              ),
            ),
            const SliverToBoxAdapter(
              child: TermsAndConditions(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomButton(
                text: AppStrings.signUp,
                onPressed: () {},
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            const SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                textOne: AppStrings.alreadyHaveAnAccount,
                textTwo: AppStrings.signUp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
