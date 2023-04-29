import 'package:appexample/features/favorites/domain/entities/favorite_entity.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';

abstract class FavoritesDataSource {
  Future<ResponseAliasDTO> addFavorite(String link);

  Future<Favorite> getFavorite(String link);
}
