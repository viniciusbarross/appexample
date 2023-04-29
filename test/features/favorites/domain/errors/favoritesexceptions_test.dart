import 'package:flutter_test/flutter_test.dart';
import 'package:appexample/features/favorites/domain/errors/favoritesexceptions.dart';

void main() {
  group('ExceptionsFavorites tests', () {
    test('should return correct string representation', () {
      expect(ExceptionAddFavorite(message: 'test').toString(), equals('ExceptionAddFavorite(message: test)'));
    });

    test('ExceptionInvalidLinkAddFavorite should set message correctly', () {
      expect(() => throw ExceptionInvalidLinkAddFavorite(),
          throwsA(predicate((e) => e is ExceptionInvalidLinkAddFavorite && e.message == 'Link inserted is invalid')));
    });

    test('ExceptionLinkCannotBeEmptyAddFavorite should set message correctly', () {
      expect(() => throw ExceptionLinkCannotBeEmptyAddFavorite(),
          throwsA(predicate((e) => e is ExceptionLinkCannotBeEmptyAddFavorite && e.message == 'Link inserted cannot be empty')));
    });

    test('should return correct string representation', () {
      expect(ExceptionGetFavorite(message: 'test').toString(), equals('ExceptionGetFavorites(message: test)'));
    });

    test('ExceptionLinkCannotBeEmptyGetFavorite should set message correctly', () {
      expect(() => throw ExceptionLinkCannotBeEmptyGetFavorite(),
          throwsA(predicate((e) => e is ExceptionLinkCannotBeEmptyGetFavorite && e.message == 'Link inserted cannot be empty')));
    });
  });
}
