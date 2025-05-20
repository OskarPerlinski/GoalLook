import 'package:flutter/material.dart';
import 'package:goallook/domain/jersey/models/jersey_models.dart';
import 'package:goallook/presentation/assets/image_display_helper.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';

class JerseyImages extends StatelessWidget {
  const JerseyImages({super.key, required this.jerseyModels});

  final JerseyModels jerseyModels;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
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
        ),
        SizedBox(width: AppDimens.s),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  ImageDisplayHelper.generateJerseyImageURL(
                    jerseyModels.images[1],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
