import 'package:dalil/core/utils/app_colors.dart';
import 'package:dalil/features/auth/features/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/cubit/auth_state.dart';
import 'custom_text_field.dart';
import 'terms_and_conditions.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                lblText: AppStrings.fristName,
                onChanged: (firstName) {
                  authCubit.firstName = firstName;
                },
              ),
              CustomTextFormField(
                lblText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                lblText: AppStrings.emailAddress,
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              CustomTextFormField(
                lblText: AppStrings.password,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const TermsAndConditions(),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: AppStrings.signUp,
                color: authCubit.termsAndConditionCheckBoxValue == true
                    ? null
                    : AppColors.grey,
                onPressed: () {
                  if (authCubit.termsAndConditionCheckBoxValue == true) {
                    if (authCubit.signUpFormKey.currentState!.validate()) {
                      authCubit.signUpWithEmailAndPassword();
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
