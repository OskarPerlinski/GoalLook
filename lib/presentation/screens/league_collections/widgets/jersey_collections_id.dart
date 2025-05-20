import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/domain/jersey/models/jersey_models.dart';
import 'package:goallook/domain/league/models/league_models.dart';
import 'package:goallook/presentation/assets/image_display_helper.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';

class JerseyCollectionsId extends HookWidget {
  const JerseyCollectionsId({
    super.key,
    required this.leagueModels,
    required this.jerseyModels,
  });

  final LeagueModels leagueModels;
  final JerseyModels jerseyModels;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.s),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                ImageDisplayHelper.generateJerseyImageURL(
                  jerseyModels.images[0],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: AppDimens.s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jerseyModels.name,
                style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold),
              ),
              AppSpacings.small(),
              Text("\$${jerseyModels.price}"),
            ],
          ),
        ),
      ],
    );
  }
}
