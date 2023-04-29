import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:appexample/core/adapters/implementation/http_dio.dart';
import 'package:appexample/core/adapters/interfaces/http_adapter.dart';
import 'package:appexample/features/favorites/external/favorites_datasource_impl.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('FavoritesDataSourceImpl', () {
    late FavoritesDataSourceImpl dataSource;
    HttpAdapter httpAdapter = HttpDio(Dio());

    setUp(() {
      GetIt.I.registerSingleton<HttpAdapter>(httpAdapter);
      dataSource = FavoritesDataSourceImpl();
    });

    test('should add favorite successfully', () async {
      final result = await dataSource.addFavorite(urlValidHttp);

      expect(result.alias, isNotNull);
      expect(result.links.self, isNotNull);
      expect(result.links.short, isNotNull);
    });

    test('should add and get favorite successfully', () async {
      final result = await dataSource.addFavorite(urlValidHttp);

      expect(result.alias, isNotNull);
      expect(result.links.self, isNotNull);
      expect(result.links.short, isNotNull);

      final result2 = await dataSource.getFavorite(result.links.short);

      expect(result2.url, result.links.self);
    });

    tearDown(() {
      GetIt.I.unregister<HttpAdapter>();
    });
  });
}
