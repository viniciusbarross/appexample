import 'package:either_dart/either.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';
import 'package:appexample/features/favorites/domain/errors/favoritesexceptions.dart';

abstract class AddFavorite {
  Future<Either<ExceptionAddFavorite, ResponseAliasDTO>> call(String link);
}
