import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/domain/league/models/league_models.dart';
import 'package:goallook/presentation/screens/league_collections/cubit/league_collections_action.dart';
import 'package:goallook/presentation/screens/league_collections/cubit/league_collections_cubit.dart';
import 'package:goallook/presentation/screens/league_collections/cubit/league_collections_state.dart';
import 'package:goallook/presentation/screens/league_collections/widgets/jersey_collections_id.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';
import 'package:goallook/widgets/appbar/basic_appbar.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class LeagueCollectionsPage extends HookWidget {
  const LeagueCollectionsPage({
    super.key,
    required this.leagueId,
    required this.leagueModels,
  });

  final String leagueId;
  final LeagueModels leagueModels;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<LeagueCollectionsCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      if (state is LeagueCollectionsNavigateToDetail) {
        // final jerseyId = action.jerseyId,
        // context.go('/leagueCollections/$jerseyId');
      }
    });

    useEffect(() {
      cubit.getJerseyByCollectionsId(leagueId);
      return null;
    }, []);

    return Scaffold(
      appBar: BasicAppbar(showBackButton: true),
      body: switch (state) {
        LeagueCollectionsLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
        LeagueCollectionsError(:final message) => Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message),
                  AppSpacings.medium(),
                  TextButton(
                    onPressed: () => cubit.getJerseyByCollectionsId(leagueId),
                    child: const Text('Failed to load. Try again!'),
                  ),
                ],
              ),
            ),
          ),
        ),
        LeagueCollectionsLoaded(:final jersey) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.ml),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${leagueModels.name} (${jersey.length})',
                style: AppTypography.h3,
              ),
              AppSpacings.medium(),
              GridView.builder(
                itemCount: jersey.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return JerseyCollectionsId(
                    leagueModels: leagueModels,
                    jerseyModels: jersey[index],
                  );
                },
              ),
            ],
          ),
        ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
