import 'package:goallook/data/jersey/datasource/jersey_data_source.dart';
import 'package:goallook/data/jersey/dto/jersey_models_dto.dart';
import 'package:goallook/data/jersey/mapper/jersey_mapper.dart';
import 'package:goallook/domain/jersey/models/jersey_models.dart';
import 'package:goallook/domain/jersey/repository/jersey_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: JerseyRepository)
class JerseyRepositoryImpl implements JerseyRepository {
  JerseyRepositoryImpl(this._jerseyDataSource, this._jerseyMapper);

  final JerseyDataSource _jerseyDataSource;
  final JerseyMapper _jerseyMapper;

  @override
  Future<List<JerseyModels>> getNewJersey() async {
    final response = await _jerseyDataSource.getNewJersey();
    return response.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final dto = JerseyModelsDto.fromJson(data);
      return _jerseyMapper.toDomain(dto);
    }).toList();
  }

  @override
  Future<List<JerseyModels>> getTopSellings() async {
    final response = await _jerseyDataSource.getTopSellings();
    return response.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final dto = JerseyModelsDto.fromJson(data);
      return _jerseyMapper.toDomain(dto);
    }).toList();
  }
}
