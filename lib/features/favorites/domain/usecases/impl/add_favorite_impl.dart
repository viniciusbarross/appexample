import 'package:either_dart/either.dart';
import 'package:appexample/core/utils/validations.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';
import 'package:appexample/features/favorites/domain/errors/favoritesexceptions.dart';
import 'package:appexample/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:appexample/features/favorites/domain/usecases/add_favorite.dart';

class AddFavoriteImpl implements AddFavorite {
  final FavoritesRepository repository;

  AddFavoriteImpl(this.repository);

  @override
  Future<Either<ExceptionAddFavorite, ResponseAliasDTO>> call(String link) async {
    if (link == '') return Left(ExceptionLinkCannotBeEmptyAddFavorite());
    if (!isValidLink(link)) return Left(ExceptionInvalidLinkAddFavorite());
    final result = await repository.addFavorite(link);
    return result;
  }
}
