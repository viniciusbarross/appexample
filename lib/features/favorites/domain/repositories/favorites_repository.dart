import 'package:either_dart/either.dart';
import 'package:appexample/features/favorites/domain/entities/favorite_entity.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';
import 'package:appexample/features/favorites/domain/errors/favoritesexceptions.dart';

abstract class FavoritesRepository {
  Future<Either<ExceptionAddFavorite, ResponseAliasDTO>> addFavorite(String link);

  Future<Either<ExceptionGetFavorite, Favorite>> getFavorite(String link);
}
