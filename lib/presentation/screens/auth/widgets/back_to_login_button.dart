import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_typography.dart';

class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go('/loginPage'),
      child: Text(
        'Back to Login Page',
        style: AppTypography.h5.copyWith(color: AppColors.black),
      ),
    );
  }
}
