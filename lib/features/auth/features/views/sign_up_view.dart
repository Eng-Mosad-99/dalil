import 'package:dalil/core/utils/app_strings.dart';
import 'package:dalil/core/widgets/custom_navigate.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_sign_up_form.dart';
import '../widgets/have_an_account_widget.dart';
import '../widgets/welcome_text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
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
              child: CustomSignUpForm(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                textOne: AppStrings.alreadyHaveAnAccount,
                textTwo: AppStrings.signIn,
                onTap: () {
                  customReplacementNavigate(context, '/signIn');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
