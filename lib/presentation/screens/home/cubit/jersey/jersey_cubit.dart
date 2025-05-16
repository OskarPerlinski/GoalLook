import 'package:goallook/domain/jersey/models/jersey_type.dart';
import 'package:goallook/domain/jersey/repository/jersey_repository.dart';
import 'package:goallook/presentation/screens/home/cubit/jersey/jersey_action.dart';
import 'package:goallook/presentation/screens/home/cubit/jersey/jersey_state.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class JerseyCubit extends ActionCubit<JerseyState, JerseyAction> {
  JerseyCubit(this._jerseyRepository) : super(JerseyState.loading());

  final JerseyRepository _jerseyRepository;

  Future<void> loadJersey(JerseyType type) async {
    emit(JerseyState.loading());
    try {
      final jersey = switch (type) {
        JerseyType.newJersey => await _jerseyRepository.getNewJersey(),
      };
      emit(JerseyState.loaded(jersey));
    } catch (e) {
      emit(JerseyState.error('Failed to load.'));
    }
  }

  void navigateToDetails(String jerseyId) {
    dispatch(JerseyAction.navigatToDetail(jerseyId));
  }
}
