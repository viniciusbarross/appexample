import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:appexample/features/favorites/domain/entities/favorite_entity.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';
import 'package:appexample/features/favorites/domain/errors/favoritesexceptions.dart';
import 'package:appexample/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:appexample/features/favorites/infra/datasources/favorites_datasource.dart';
import 'package:appexample/features/favorites/infra/repositories/favorites_repository_impl.dart';

import '../../../../mocks/mocks.dart';

import 'favorites_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FavoritesDataSource>()])
void main() {
  final datasource = MockFavoritesDataSource();
  FavoritesRepository repository = FavoritesRepositoryImpl(datasource);

  group('addFavorite', () {
    when(datasource.addFavorite('')).thenAnswer((_) async {
      throw ExceptionLinkCannotBeEmptyAddFavorite();
    });
    when(datasource.addFavorite(urlValidHttp)).thenAnswer((_) async {
      return ResponseAliasDTO.fromJson(jsonDecode(jsonResponseAliasDtoMock));
    });

    when(datasource.addFavorite(urlValidWithoutHttp)).thenAnswer((_) async {
      return ResponseAliasDTO.fromJson(jsonDecode(jsonResponseAliasDtoMock));
    });

    when(datasource.addFavorite(urlInvalidWord)).thenAnswer((_) async {
      throw ExceptionInvalidLinkAddFavorite();
    });
    test('returns Right when adding a valid favorite', () async {
      final result = await repository.addFavorite(urlValidHttp);
      expect(result, isA<Right>());
      expect(result.right, isA<ResponseAliasDTO>());
    });

    test('returns Left when adding an invalid favorite', () async {
      final result = await repository.addFavorite(urlInvalidWord);
      expect(result.left, isA<ExceptionAddFavorite>());
    });
    test('Should return object responsealiasDTO when added link', () async {
      final result = await repository.addFavorite(urlValidHttp);
      expect(result.isRight, true);
      expect(result.right, isInstanceOf<ResponseAliasDTO>());
      expect(result.right.alias, isNotEmpty);

      final result2 = await repository.addFavorite(urlValidWithoutHttp);
      expect(result2.isRight, true);
      expect(result2.right, isInstanceOf<ResponseAliasDTO>());
      expect(result2.right.alias, isNotEmpty);
    });
  });

  group('getFavorite', () {
    when(datasource.getFavorite('')).thenAnswer((_) async {
      throw ExceptionLinkCannotBeEmptyGetFavorite();
    });
    when(datasource.getFavorite(urlInvalidWord)).thenAnswer((_) async {
      throw ExceptionInvalidLinkGetFavorite();
    });
    when(datasource.getFavorite(urlValidHttp)).thenAnswer((_) async {
      return Favorite(urlValidHttp);
    });
    when(datasource.getFavorite(urlValidWithoutHttp)).thenAnswer((_) async {
      return Favorite(urlValidWithoutHttp);
    });
    test('returns Right when getting an existing favorite', () async {
      final result = await repository.getFavorite(urlValidHttp);
      expect(result, isA<Right>());
      expect(result.right, isA<Favorite>());
    });

    test('returns Left when getting a non-existing favorite', () async {
      final result = await repository.getFavorite(urlInvalidWord);
      expect(result.left, isA<ExceptionGetFavorite>());
    });

    test('Should return success if get favorite correctly', () async {
      final result = await repository.getFavorite(urlValidHttp);
      expect(result.isRight, true);
      expect(result.right, isInstanceOf<Favorite>());

      final result2 = await repository.getFavorite(urlInvalidWord);
      expect(result2.isLeft, true);
      expect(result2.left, isA<ExceptionGetFavorite>());

      final result3 = await repository.getFavorite(urlValidWithoutHttp);
      expect(result3.isRight, true);
      expect(result3.right, isInstanceOf<Favorite>());
      expect(result3.right.url, isNotEmpty);
    });
  });
}
