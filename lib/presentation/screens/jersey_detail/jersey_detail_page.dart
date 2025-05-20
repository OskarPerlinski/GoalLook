import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/domain/jersey/models/jersey_models.dart';
import 'package:goallook/presentation/screens/jersey_detail/widgets/jersey_images.dart';
import 'package:goallook/presentation/screens/jersey_detail/widgets/jersey_information.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/widgets/appbar/basic_appbar.dart';
import 'package:goallook/widgets/button/basic_button.dart';

class JerseyDetailPage extends HookWidget {
  const JerseyDetailPage({
    super.key,
    required this.jerseyId,
    required this.jerseyModels,
  });

  final String jerseyId;
  final JerseyModels jerseyModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(showBackButton: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JerseyImages(jerseyModels: jerseyModels),
          AppSpacings.large(),
          JerseyInformation(jerseyModels: jerseyModels),
          AppSpacings.xLarge(),
          BasicButton(onPressed: () {}, text: 'Add to Bag'),
        ],
      ),
    );
  }
}
