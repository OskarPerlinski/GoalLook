import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_typography.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppbar({
    super.key,
    this.height,
    this.showBackButton = false,
    this.showBagIcon = false,
  });

  final double? height;
  final bool showBackButton;
  final bool showBagIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
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
      actions:
          showBagIcon
              ? [
                Padding(
                  padding: EdgeInsets.only(right: AppDimens.ml),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.black,
                    ),
                    onPressed: () {
                      context.push('/bagPage');
                    },
                  ),
                ),
              ]
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
