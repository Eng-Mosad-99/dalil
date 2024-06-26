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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                lblText: AppStrings.fristName,
                onChanged: (firstName) {
                  BlocProvider.of<AuthCubit>(context).firstName = firstName;
                },
              ),
              CustomTextFormField(
                lblText: AppStrings.lastName,
                onChanged: (lastName) {
                  BlocProvider.of<AuthCubit>(context).lastName = lastName;
                },
              ),
              CustomTextFormField(
                lblText: AppStrings.emailAddress,
                onChanged: (email) {
                  BlocProvider.of<AuthCubit>(context).emailAddress = email;
                },
              ),
              CustomTextFormField(
                lblText: AppStrings.password,
                onChanged: (password) {
                  BlocProvider.of<AuthCubit>(context).password = password;
                },
              ),
              const TermsAndConditions(),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: AppStrings.signUp,
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context)
                      .signUpWithEmailAndPassword();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
