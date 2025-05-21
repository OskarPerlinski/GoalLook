import 'package:goallook/data/bag/datasource/bag_data_source.dart';
import 'package:goallook/data/bag/mapper/bag_mapper.dart';
import 'package:goallook/domain/bag/models/bag_models.dart';
import 'package:goallook/domain/bag/repository/bag_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: BagRepository)
class BagRepositoryImpl implements BagRepository {
  BagRepositoryImpl(this._bagDataSource, this._bagMapper);

  final BagDataSource _bagDataSource;
  final BagMapper _bagMapper;

  @override
  Future<void> addJerseyToBag(BagModels bagmodels) async {
    final dto = _bagMapper.toDto(bagmodels);
    return _bagDataSource.addJerseyToBag(dto.toJson());
  }
}
