import 'package:flutter/material.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_typography.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.ml),
      child: SizedBox(
        height: AppDimens.xxl,
        width: double.infinity,
        child: FilledButton(
          onPressed: onPressed,
          child: Text(text, style: AppTypography.h2),
        ),
      ),
    );
  }
}
