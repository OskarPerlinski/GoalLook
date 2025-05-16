import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/domain/jersey/models/jersey_type.dart';
import 'package:goallook/presentation/assets/image_display_helper.dart';
import 'package:goallook/presentation/screens/home/cubit/jersey/jersey_action.dart';
import 'package:goallook/presentation/screens/home/cubit/jersey/jersey_cubit.dart';
import 'package:goallook/presentation/screens/home/cubit/jersey/jersey_state.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class JerseyList extends HookWidget {
  const JerseyList({super.key, required this.text, required this.type});

  final String text;
  final JerseyType type;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<JerseyCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      if (state is JerseyNavigateToDetail) {
        // final jerseyId = action.jerseyId,
        // context.go('/detail/$productId');
      }
    });

    useEffect(() {
      cubit.loadJersey(type);
      return null;
    }, [type]);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.ml),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: AppTypography.h2),
          AppSpacings.medium(),
          switch (state) {
            JerseyLoading() => const Center(child: CircularProgressIndicator()),
            JerseyError(:final message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message),
                  AppSpacings.medium(),
                  TextButton(
                    onPressed: () => cubit.loadJersey(type),
                    child: const Text('Failed to load. Try again!'),
                  ),
                ],
              ),
            ),
            JerseyLoaded(:final jersey) => SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Zdjęcie
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppDimens.s),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                ImageDisplayHelper.generateJerseyImageURL(
                                  jersey[index].images[1],
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
                                jersey[index].name,
                                style: AppTypography.h5.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: AppDimens.xs),
                              Text(
                                "\$${jersey[index].price}",
                                style: AppTypography.h6,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder:
                    (context, index) => SizedBox(width: AppDimens.m),
                itemCount: jersey.length,
              ),
            ),
            _ => const Center(child: CircularProgressIndicator()),
          },
        ],
      ),
    );
  }
}
