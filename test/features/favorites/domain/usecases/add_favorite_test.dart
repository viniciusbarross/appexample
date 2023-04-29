import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';
import 'package:appexample/features/favorites/domain/errors/favoritesexceptions.dart';
import 'package:appexample/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:appexample/features/favorites/domain/usecases/add_favorite.dart';
import 'package:appexample/features/favorites/domain/usecases/impl/add_favorite_impl.dart';

import '../../../../mocks/mocks.dart';
@GenerateNiceMocks([MockSpec<FavoritesRepository>()])
import 'add_favorite_test.mocks.dart';

void main() {
  final repository = MockFavoritesRepository();
  AddFavorite addFavorite = AddFavoriteImpl(repository);

  when(repository.addFavorite(any)).thenAnswer((_) async {
    return Right(ResponseAliasDTO.fromJson(jsonDecode(jsonResponseAliasDtoMock)));
  });

  when(repository.addFavorite('')).thenAnswer((_) async {
    return Right(ResponseAliasDTO.fromJson(jsonDecode(jsonResponseAliasDtoMock)));
  });

  when(repository.addFavorite(urlValidHttp)).thenAnswer((_) async {
    return Right(ResponseAliasDTO.fromJson(jsonDecode(jsonResponseAliasDtoMock)));
  });

  when(repository.addFavorite(urlValidWithoutHttp)).thenAnswer((_) async {
    return Right(ResponseAliasDTO.fromJson(jsonDecode(jsonResponseAliasDtoMock)));
  });

  when(repository.addFavorite(urlInvalidWord)).thenAnswer((_) async {
    return Right(ResponseAliasDTO.fromJson(jsonDecode(jsonResponseAliasDtoMock)));
  });

  test('Should return exception if inserted favorite invalid or empty', () async {
    final result = await addFavorite('');
    expect(result.isLeft, true);
    expect(result.left, isA<ExceptionLinkCannotBeEmptyAddFavorite>());

    final result2 = await addFavorite(urlInvalidWord);
    expect(result2.isLeft, true);
    expect(result2.left, isA<ExceptionInvalidLinkAddFavorite>());
  });

  test('Should return object if inserted favorite correctly', () async {
    final result = await addFavorite(urlValidHttp);
    expect(result.isRight, true);
    expect(result.right, isInstanceOf<ResponseAliasDTO>());

    final result2 = await addFavorite(urlValidWithoutHttp);
    expect(result2.isRight, true);
    expect(result2.right, isInstanceOf<ResponseAliasDTO>());
  });
}
