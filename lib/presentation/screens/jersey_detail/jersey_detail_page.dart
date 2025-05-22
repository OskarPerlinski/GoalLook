import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/domain/bag/models/bag_models.dart';
import 'package:goallook/domain/jersey/models/jersey_models.dart';
import 'package:goallook/presentation/screens/jersey_detail/cubit/bag_action.dart';
import 'package:goallook/presentation/screens/jersey_detail/cubit/bag_cubit.dart';
import 'package:goallook/presentation/screens/jersey_detail/cubit/bag_state.dart';
import 'package:goallook/presentation/screens/jersey_detail/widgets/jersey_images.dart';
import 'package:goallook/presentation/screens/jersey_detail/widgets/jersey_information.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';
import 'package:goallook/widgets/appbar/basic_appbar.dart';
import 'package:goallook/widgets/button/basic_button.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

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
    final cubit = useBloc<BagCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      switch (action) {
        case BagSuccess():
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Successfully added to bag.',
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        case BagShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        case BagHideLoading():
          Navigator.of(context).pop();
        case BagShowErrorMessage(:final message):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.error,
            ),
          );
      }
    });

    return Scaffold(
      appBar: BasicAppbar(showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: switch (state) {
            BagInitial() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JerseyImages(jerseyModels: jerseyModels),
                AppSpacings.large(),
                JerseyInformation(jerseyModels: jerseyModels),
                AppSpacings.xLarge(),
                BasicButton(
                  onPressed: () {
                    cubit.addJerseyToBag(
                      BagModels(
                        name: jerseyModels.name,
                        size: jerseyModels.size,
                        jerseyId: jerseyId,
                        price: jerseyModels.price,
                        images: jerseyModels.images,
                        player: jerseyModels.player,
                        id: '',
                      ),
                    );
                  },
                  text: 'Add to Bag',
                ),
              ],
            ),
            _ => Center(child: CircularProgressIndicator()),
          },
        ),
      ),
    );
  }
}
