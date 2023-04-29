import 'package:either_dart/either.dart';
import 'package:appexample/features/favorites/domain/entities/favorite_entity.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';
import 'package:appexample/features/favorites/domain/errors/favoritesexceptions.dart';
import 'package:appexample/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:appexample/features/favorites/infra/datasources/favorites_datasource.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesDataSource dataSource;

  FavoritesRepositoryImpl(this.dataSource);

  @override
  Future<Either<ExceptionAddFavorite, ResponseAliasDTO>> addFavorite(String link) async {
    try {
      final retorno = await dataSource.addFavorite(link);
      return Right(retorno);
    } catch (e) {
      return Left(ExceptionAddFavorite(message: 'Error on trying save favorite website: $e'));
    }
  }

  @override
  Future<Either<ExceptionGetFavorite, Favorite>> getFavorite(String link) async {
    try {
      final retorno = await dataSource.getFavorite(link);
      return Right(retorno);
    } catch (e) {
      return Left(ExceptionGetFavorite(message: 'Error on trying get favorite websites: $e'));
    }
  }
}
