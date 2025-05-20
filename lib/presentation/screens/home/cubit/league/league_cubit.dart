import 'package:goallook/domain/league/repository/league_repository.dart';
import 'package:goallook/presentation/screens/home/cubit/league/league_action.dart';
import 'package:goallook/presentation/screens/home/cubit/league/league_state.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LeagueCubit extends ActionCubit<LeagueState, LeagueAction> {
  LeagueCubit(this._leagueRepository) : super(LeagueState.loading());

  final LeagueRepository _leagueRepository;

  Future<void> getLeagueCategory() async {
    emit(LeagueState.loading());
    try {
      final league = await _leagueRepository.getLeagueCategory();
      emit(LeagueState.loaded(league));
    } catch (e) {
      emit(LeagueState.error('Failed to load'));
    }
  }

  void navigateToCategoryDetial(String leagueId) {
    dispatch(LeagueAction.navigateToDetail(leagueId));
  }
}
