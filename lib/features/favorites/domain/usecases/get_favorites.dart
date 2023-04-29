import 'package:either_dart/either.dart';
import 'package:appexample/features/favorites/domain/entities/favorite_entity.dart';
import 'package:appexample/features/favorites/domain/errors/favoritesexceptions.dart';

abstract class GetFavorite {
  Future<Either<ExceptionGetFavorite, Favorite>> call(String link);
}
