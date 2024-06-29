import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? emailAddress, password, firstName, lastName;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  bool? termsAndConditionCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;

  signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState('The account already exists for that email.'));
      }
    } catch (e) {
      log(e.toString());
      emit(SignUpFailureState(e.toString()));
    }
  }

  updateTermsAndConditionCheckBox({required bool newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(UpdateTermsAndConditionCheckBoxState());
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignUpFailureState('No user found for this email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignUpFailureState('wrong password provided for that user.'));
      }
    } catch (e) {
      log(e.toString());
      emit(SignUpFailureState(e.toString()));
    }
  }
}
