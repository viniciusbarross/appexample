import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:appexample/features/favorites/domain/entities/favorite_entity.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('Favorite constructor should set value correctly', () {
    final favorite = Favorite(urlValidHttp);

    expect(favorite.url, urlValidHttp);
  });

  test('Favorite fromJson should parse JSON correctly', () {
    final json = {'url': urlValidHttp};
    final favorite = Favorite.fromJson(json);

    expect(favorite.url, json['url']);
  });

  test('Favorite toJson should serialize correctly', () {
    final favorite = Favorite(urlValidHttp);
    final json = favorite.toJson();

    expect(json['url'], urlValidHttp);
  });

  test('Favorite fromJson should throw exception with invalid JSON', () {
    expect(() => Favorite.fromJson(jsonDecode(jsonEmptyMock)), throwsFormatException);
  });
}
