import 'package:flutter/material.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_typography.dart'; // Make sure to import your typography

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppbar({super.key, this.height, this.showBackButton = false});

  final double? height;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading:
          showBackButton
              ? IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.black),
                onPressed: () => Navigator.of(context).maybePop(),
              )
              : null,
      title: RichText(
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
