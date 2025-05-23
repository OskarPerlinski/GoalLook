import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_typography.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:() => context.go('/loginPage'),
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: AppTypography.h5.copyWith(color: AppColors.secondary),
          children: [
            TextSpan(
              text: 'Sign In',
              style: AppTypography.h5.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}