// Mocks generated by Mockito 5.4.0 from annotations
// in appexample/test/features/favorites/domain/repositories/favorites_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:appexample/features/favorites/domain/entities/favorite_entity.dart' as _i3;
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart' as _i2;
import 'package:appexample/features/favorites/infra/datasources/favorites_datasource.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponseAliasDTO_0 extends _i1.SmartFake implements _i2.ResponseAliasDTO {
  _FakeResponseAliasDTO_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFavorite_1 extends _i1.SmartFake implements _i3.Favorite {
  _FakeFavorite_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FavoritesDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoritesDataSource extends _i1.Mock implements _i4.FavoritesDataSource {
  @override
  _i5.Future<_i2.ResponseAliasDTO> addFavorite(String? link) => (super.noSuchMethod(
        Invocation.method(
          #addFavorite,
          [link],
        ),
        returnValue: _i5.Future<_i2.ResponseAliasDTO>.value(_FakeResponseAliasDTO_0(
          this,
          Invocation.method(
            #addFavorite,
            [link],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i2.ResponseAliasDTO>.value(_FakeResponseAliasDTO_0(
          this,
          Invocation.method(
            #addFavorite,
            [link],
          ),
        )),
      ) as _i5.Future<_i2.ResponseAliasDTO>);
  @override
  _i5.Future<_i3.Favorite> getFavorite(String? link) => (super.noSuchMethod(
        Invocation.method(
          #getFavorite,
          [link],
        ),
        returnValue: _i5.Future<_i3.Favorite>.value(_FakeFavorite_1(
          this,
          Invocation.method(
            #getFavorite,
            [link],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i3.Favorite>.value(_FakeFavorite_1(
          this,
          Invocation.method(
            #getFavorite,
            [link],
          ),
        )),
      ) as _i5.Future<_i3.Favorite>);
}