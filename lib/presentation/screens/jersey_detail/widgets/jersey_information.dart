import 'package:flutter/material.dart';
import 'package:goallook/domain/jersey/models/jersey_models.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';

class JerseyInformation extends StatelessWidget {
  const JerseyInformation({super.key, required this.jerseyModels});

  final JerseyModels jerseyModels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.ml),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(jerseyModels.name, style: AppTypography.h1),
          AppSpacings.medium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.primary),
                  Text(
                    jerseyModels.raiting,
                    style: AppTypography.h4.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'SIZE: ',
                    style: AppTypography.h4.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    jerseyModels.size,
                    style: AppTypography.h4.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              Text(
                "\$${jerseyModels.price}",
                style: AppTypography.h4.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          AppSpacings.xLarge(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Player: ',
                    style: AppTypography.h4.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    jerseyModels.player,
                    style: AppTypography.h4.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Season: ',
                    style: AppTypography.h4.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    jerseyModels.season,
                    style: AppTypography.h4.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
