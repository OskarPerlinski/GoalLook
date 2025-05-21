import 'package:goallook/domain/bag/models/bag_models.dart';
import 'package:goallook/domain/bag/repository/bag_repository.dart';
import 'package:goallook/presentation/screens/jersey_detail/cubit/bag_action.dart';
import 'package:goallook/presentation/screens/jersey_detail/cubit/bag_state.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BagCubit extends ActionCubit<BagState, BagAction> {
  BagCubit(this._bagRepository) : super(BagState.initial());

  final BagRepository _bagRepository;

  Future<void> addJerseyToBag(BagModels bagmodels) async {
    dispatch(BagAction.showLoading());
    try {
      await _bagRepository.addJerseyToBag(bagmodels);
      dispatch(BagAction.success());
    } catch (e) {
      dispatch(BagAction.showErrorMessage('Failed to add jersey.'));
    } finally {
      dispatch(BagAction.hideLoading());
    }
  }
}
