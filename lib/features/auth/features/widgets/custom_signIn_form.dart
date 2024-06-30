// ignore_for_file: file_names
import 'package:dalil/core/functions/custom_toast.dart';
import 'package:dalil/core/utils/app_colors.dart';
import 'package:dalil/core/widgets/custom_navigate.dart';
import 'package:dalil/features/auth/features/auth_cubit/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/cubit/auth_state.dart';
import 'custom_text_field.dart';
import 'forget_password_text.dart';

class CustomSignInForm extends StatefulWidget {
  const CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, '/home')
              : customToast('Please verify your email');
        } else if (state is SignInFailureState) {
          customToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signInFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                lblText: AppStrings.emailAddress,
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              CustomTextFormField(
                lblText: AppStrings.password,
                obscureText: authCubit.obscurePasswordTextValue,
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_rounded,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const ForgetPasswordTextWidget(),
              const SizedBox(
                height: 70,
              ),
              state is SignInLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.kPrimarycolor,
                    )
                  : CustomButton(
                      text: AppStrings.signIn,
                      onPressed: () {
                        if (authCubit.signInFormKey.currentState!.validate()) {
                          authCubit.signInWithEmailAndPassword();
                        }
                      }),
            ],
          ),
        );
      },
    );
  }
}
