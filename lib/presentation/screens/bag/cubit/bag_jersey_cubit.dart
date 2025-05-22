import 'package:goallook/domain/bag/repository/bag_repository.dart';
import 'package:goallook/presentation/screens/bag/cubit/bag_jersey_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BagJerseyCubit extends Cubit<BagJerseyState> {
  BagJerseyCubit(this._bagRepository) : super(const BagJerseyState.loading());

  final BagRepository _bagRepository;

  Future<void> getBagProducts() async {
    emit(const BagJerseyState.loading());
    try {
      final bag = await _bagRepository.getBagProducts();
      emit(BagJerseyState.loaded(bag));
    } catch (e) {
      emit(const BagJerseyState.error('Failed to load bag products'));
    }
  }
}
