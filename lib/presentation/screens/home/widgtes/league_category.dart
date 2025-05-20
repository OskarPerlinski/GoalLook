import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:goallook/presentation/assets/image_display_helper.dart';
import 'package:goallook/presentation/screens/home/cubit/league/league_action.dart';
import 'package:goallook/presentation/screens/home/cubit/league/league_cubit.dart';
import 'package:goallook/presentation/screens/home/cubit/league/league_state.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class LeagueCategory extends HookWidget {
  const LeagueCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<LeagueCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      if (action is LeagueNavigateToDetail) {
        final leagueId = action.leagueId;
        context.go('/leagueCollections/$leagueId');
      }
    });

    useEffect(() {
      cubit.getLeagueCategory();
      return null;
    }, []);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.ml),
      child: switch (state) {
        LeagueLoading() => const Center(child: CircularProgressIndicator()),
        LeagueError(:final message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              AppSpacings.medium(),
              TextButton(
                onPressed: () => cubit.getLeagueCategory(),
                child: const Text('Failed to load. Try again!'),
              ),
            ],
          ),
        ),
        LeagueLoaded(:final league) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('League Collections', style: AppTypography.h2),
            AppSpacings.medium(),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: league.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 240,
                  child: GestureDetector(
                    onTap: () {
                      context.push(
                        '/leagueCollections/${league[index].leagueId}',
                        extra: league[index],
                      );
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 160,
                            width: double.infinity,
                            child: Image.network(
                              ImageDisplayHelper.generateLeagueCategoryImageURL(
                                league[index].image,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        AppSpacings.small(),
                        Text(
                          league[index].name,
                          style: AppTypography.h4.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
