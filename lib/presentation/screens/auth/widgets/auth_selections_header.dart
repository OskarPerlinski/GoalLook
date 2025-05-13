import 'package:flutter/material.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';

class AuthSelectionsHeader extends StatelessWidget {
  const AuthSelectionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.xxl),
      child: Column(
        children: [
          Text(
            'Wear the Game.\nLive the Passion.',
            style: AppTypography.h1.copyWith(color: AppColors.primary),
          ),
          AppSpacings.large(),
          Text(
            'Discover exclusive football jerseys tailored to your club loyalty and style.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
