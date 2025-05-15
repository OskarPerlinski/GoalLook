import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:goallook/presentation/screens/splash/cubit/splash_action.dart';
import 'package:goallook/presentation/screens/splash/cubit/splash_cubit.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_typography.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SplashCubit>();

    useEffect(() {
      cubit.checkIfLoggedIn();
      return null;
    }, []);

    useActionListener<SplashAction>(cubit, (action) {
      switch (action) {
        case SplashAuthenticated():
          context.go('/homePage');
        case SplashUnAuthenticated():
          context.go('/selectionPage');
      }
    });

    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Goal',
                style: AppTypography.h1.copyWith(color: AppColors.black),
              ),
              TextSpan(
                text: 'Look',
                style: AppTypography.h1.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
