import 'package:flutter/material.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.headerText,
    required this.secondText,
  });

  final String headerText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.xxl),
      child: Center(
        child: Column(
          children: [
            Text(
              headerText,
              style: AppTypography.h1.copyWith(color: AppColors.primary),
            ),
            AppSpacings.large(),
            Text(
              secondText,
              textAlign: TextAlign.center,
              style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
