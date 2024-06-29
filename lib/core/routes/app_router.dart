import 'package:dalil/features/auth/features/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalil/features/auth/features/views/sign_up_view.dart';
import 'package:dalil/features/home/presentation/views/home_view.dart';
import 'package:dalil/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalil/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/features/views/sign_in_view.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: '/onBoarding',
    builder: (context, state) => const OnBoardingView(),
  ),
  GoRoute(
    path: '/signUp',
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const SignUpView(),
    ),
  ),
  GoRoute(
    path: '/signIn',
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const SignInView(),
    ),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeView(),
  ),
]);
