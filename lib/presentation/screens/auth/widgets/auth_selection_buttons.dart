import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';

class AuthSelectionButtons extends StatelessWidget {
  const AuthSelectionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.xxl),
        child: Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () => context.go('/loginPage'),
                child: Text('Login'),
              ),
            ),
            SizedBox(width: AppDimens.s),
            Expanded(
              child: FilledButton(
                onPressed: () => context.go('/createAccount'),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.white),
                  side: WidgetStateProperty.all(
                    BorderSide(color: AppColors.primary, width: 2.0),
                  ),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(color: AppColors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
