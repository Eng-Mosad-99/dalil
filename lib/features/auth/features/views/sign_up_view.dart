import 'package:dalil/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_sign_up_form.dart';
import '../widgets/have_an_account_widget.dart';
import '../widgets/welcome_text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 80,
              ),
            ),
            SliverToBoxAdapter(
              child: WelcomeTextWidget(
                text: AppStrings.welcome,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomSignUpForm(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                textOne: AppStrings.alreadyHaveAnAccount,
                textTwo: AppStrings.signIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

