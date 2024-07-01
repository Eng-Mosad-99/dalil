import 'package:dalil/core/utils/app_strings.dart';
import 'package:dalil/features/auth/features/widgets/custom_forget_password_form.dart';
import 'package:dalil/features/auth/features/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/forget_password_image.dart';
import '../widgets/forget_password_subTitle.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(height: 108),
          ),
          SliverToBoxAdapter(
            child: WelcomeTextWidget(
              text: AppStrings.forgotPasswordPage,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
          SliverToBoxAdapter(
            child: ForgetPasswordImage(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
          SliverToBoxAdapter(
            child: ForgetPasswordSubTitle(),
          ),
          SliverToBoxAdapter(
            child: CustomForgetPasswordForm(),
          ),
        ],
      ),
    );
  }
}
