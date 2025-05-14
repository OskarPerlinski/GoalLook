import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_typography.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimens.xxl,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          'assets/images/google.svg',
          width: 25,
          height: 25,
        ),
        label: Text(text, style: AppTypography.h4),
      ),
    );
  }
}
