import 'package:either_dart/either.dart';
import 'package:appexample/features/favorites/domain/entities/favorite_entity.dart';
import 'package:appexample/features/favorites/domain/errors/favoritesexceptions.dart';
import 'package:appexample/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:appexample/features/favorites/domain/usecases/get_favorites.dart';

class GetFavoriteImpl implements GetFavorite {
  final FavoritesRepository repository;

  GetFavoriteImpl(this.repository);

  @override
  Future<Either<ExceptionGetFavorite, Favorite>> call(String link) async {
    if (link.isEmpty) return Left(ExceptionLinkCannotBeEmptyGetFavorite());

    return await repository.getFavorite(link);
  }
}
