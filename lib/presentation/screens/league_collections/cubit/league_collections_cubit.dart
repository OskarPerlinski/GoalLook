import 'package:goallook/domain/jersey/repository/jersey_repository.dart';
import 'package:goallook/presentation/screens/league_collections/cubit/league_collections_action.dart';
import 'package:goallook/presentation/screens/league_collections/cubit/league_collections_state.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LeagueCollectionsCubit
    extends ActionCubit<LeagueCollectionsState, LeagueCollectionsAction> {
  LeagueCollectionsCubit(this._jerseyRepository)
    : super(LeagueCollectionsState.loading());

  final JerseyRepository _jerseyRepository;

  Future<void> getJerseyByCollectionsId(String leagueId) async {
    emit(LeagueCollectionsState.loading());
    try {
      final jersey = await _jerseyRepository.getJerseyByCollectionsId(leagueId);
      emit(LeagueCollectionsState.loaded(jersey));
    } catch (e) {
      emit(LeagueCollectionsState.error('Failed to load'));
    }
  }
  void navigateToDetails(String jerseyId) {
    dispatch(LeagueCollectionsAction.navigateToDetail(jerseyId));
  }
}
