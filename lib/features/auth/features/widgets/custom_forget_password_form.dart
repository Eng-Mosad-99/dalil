import 'package:dalil/core/functions/custom_toast.dart';
import 'package:dalil/core/utils/app_strings.dart';
import 'package:dalil/core/widgets/custom_btn.dart';
import 'package:dalil/core/widgets/custom_navigate.dart';
import 'package:dalil/features/auth/features/widgets/custom_text_field.dart';
import 'package:dalil/features/auth/features/widgets/forget_password_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../auth_cubit/cubit/auth_cubit.dart';
import '../auth_cubit/cubit/auth_state.dart';

class CustomForgetPasswordForm extends StatelessWidget {
  const CustomForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccessState) {
          customToast('Check your email to reset password');
          customReplacementNavigate(context, '/signIn');
        } else if (state is ForgetPasswordFailureState) {
          customToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: authCubit.resetPasswordFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  lblText: AppStrings.emailAddress,
                  onChanged: (email) {
                    authCubit.emailAddress = email;
                  },
                ),
                const SizedBox(
                  height: 70,
                ),
                state is SignInLoadingState
                    ? const CircularProgressIndicator(
                        color: AppColors.kPrimarycolor,
                      )
                    : CustomButton(
                        text: AppStrings.sendResetPasswordLink,
                        onPressed: () {
                          if (authCubit.resetPasswordFormKey.currentState!
                              .validate()) {
                            authCubit.resetPasswordWithLink();
                          }
                        }),
              ],
            ),
          ),
        );
      },
    );
  }
}
