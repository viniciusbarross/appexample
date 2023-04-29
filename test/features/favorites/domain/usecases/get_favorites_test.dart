import 'package:flutter_test/flutter_test.dart';

import 'package:either_dart/either.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:appexample/features/favorites/domain/entities/favorite_entity.dart';
import 'package:appexample/features/favorites/domain/errors/favoritesexceptions.dart';
import 'package:appexample/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:appexample/features/favorites/domain/usecases/get_favorites.dart';
import 'package:appexample/features/favorites/domain/usecases/impl/get_favorites_impl.dart';

import '../../../../mocks/mocks.dart';
@GenerateNiceMocks([MockSpec<FavoritesRepository>()])
import 'add_favorite_test.mocks.dart';

void main() {
  final repository = MockFavoritesRepository();
  GetFavorite getFavorite = GetFavoriteImpl(repository);

  when(repository.getFavorite(any)).thenAnswer((_) async {
    return Right(Favorite(urlValidWithoutHttp));
  });

  test('Should return exception if get favorite is empty', () async {
    final result = await getFavorite('');
    expect(result.isLeft, true);
    expect(result.left, isA<ExceptionLinkCannotBeEmptyGetFavorite>());
  });

  test('Should return success if get favorite correctly', () async {
    final result = await getFavorite(urlValidHttp);
    expect(result.isRight, true);
    expect(result.right, isInstanceOf<Favorite>());

    final result2 = await getFavorite(urlInvalidWord);
    expect(result2.isRight, true);
    expect(result2.right.url, isNotEmpty);

    final result3 = await getFavorite(urlValidWithoutHttp);
    expect(result3.isRight, true);
    expect(result3.right, isInstanceOf<Favorite>());
  });
}
