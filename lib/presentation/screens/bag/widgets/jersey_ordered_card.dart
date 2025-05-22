import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/presentation/assets/image_display_helper.dart';
import 'package:goallook/presentation/screens/bag/cubit/bag_jersey_cubit.dart';
import 'package:goallook/presentation/screens/bag/cubit/bag_jersey_state.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class JerseyOrderedCard extends HookWidget {
  const JerseyOrderedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<BagJerseyCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(() {
      cubit.getBagProducts();
      return null;
    }, []);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.ml),
      child: switch (state) {
        BagJerseyLoading() => const Center(child: CircularProgressIndicator()),
        BagJerseyError(:final message) => Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message),
                  const AppSpacings.medium(),
                  TextButton(
                    onPressed: () => cubit.getBagProducts(),
                    child: const Text('Failed to load. Try again!'),
                  ),
                ],
              ),
            ),
          ),
        ),
        BagJerseyLoaded(:final bag) =>
          bag.isEmpty
              ? const Center(child: Text('Your bag is empty :C'))
              : ListView.separated(
                itemCount: bag.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder:
                    (context, index) => const AppSpacings.medium(),
                itemBuilder: (context, index) {
                  final jersey = bag[index];
                  return Container(
                    padding: const EdgeInsets.all(AppDimens.m),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(
                                ImageDisplayHelper.generateJerseyImageURL(
                                  jersey.images[0],
                                ),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppDimens.m),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                jersey.name,
                                style: AppTypography.h4.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const AppSpacings.small(),
                              Text(
                                'Player: ${jersey.player}',
                                style: AppTypography.h5.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              const AppSpacings.small(),
                              Text(
                                'Size: ${jersey.size}',
                                style: AppTypography.h5.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              const AppSpacings.small(),
                              Text(
                                'Price: \$${jersey.price}',
                                style: AppTypography.h5.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              const AppSpacings.medium(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      color: AppColors.error,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: AppColors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
