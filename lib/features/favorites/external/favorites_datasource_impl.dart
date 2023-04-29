import 'package:get_it/get_it.dart';
import 'package:appexample/core/adapters/interfaces/http_adapter.dart';
import 'package:appexample/features/favorites/domain/entities/favorite_entity.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';
import 'package:appexample/features/favorites/infra/datasources/favorites_datasource.dart';

class FavoritesDataSourceImpl implements FavoritesDataSource {
  @override
  Future<ResponseAliasDTO> addFavorite(String link) async {
    final http = GetIt.I.get<HttpAdapter>();
    final response = await http.post('http://localhost:3000/api/alias', data: {"url": link});

    final dto = ResponseAliasDTO.fromJson(response.data);
    return dto;
  }

  @override
  Future<Favorite> getFavorite(String link) async {
    final http = GetIt.I.get<HttpAdapter>();
    final url = link.replaceAll('alias', 'api/alias');
    final response = await http.get(url);
    return Favorite.fromJson(response.data);
  }
}
