import 'package:goallook/domain/bag/models/bag_models.dart';

abstract class BagRepository {
  Future<void> addJerseyToBag(BagModels bagmodels);
  Future<List<BagModels>> getBagProducts();
}
