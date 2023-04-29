import 'package:get_it/get_it.dart';
import 'package:appexample/core/adapters/implementation/http_dio.dart';
import 'package:appexample/core/adapters/interfaces/http_adapter.dart';
import 'package:appexample/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:appexample/features/favorites/domain/usecases/add_favorite.dart';
import 'package:appexample/features/favorites/domain/usecases/get_favorites.dart';
import 'package:appexample/features/favorites/domain/usecases/impl/add_favorite_impl.dart';
import 'package:appexample/features/favorites/domain/usecases/impl/get_favorites_impl.dart';
import 'package:appexample/features/favorites/external/favorites_datasource_impl.dart';
import 'package:appexample/features/favorites/infra/datasources/favorites_datasource.dart';
import 'package:appexample/features/favorites/infra/repositories/favorites_repository_impl.dart';
import 'package:dio/dio.dart';

class InjectConfig {
  static injectDependencies() {
    //Datasources
    FavoritesDataSource favoritesDataSource = FavoritesDataSourceImpl();

    //Repositories
    FavoritesRepository favoritesRepository = FavoritesRepositoryImpl(favoritesDataSource);

    //Usecases
    AddFavorite addFavorite = AddFavoriteImpl(favoritesRepository);
    GetFavorite getFavorites = GetFavoriteImpl(favoritesRepository);

    //Inject dependencies
    GetIt.I.registerSingleton<AddFavorite>(addFavorite);
    GetIt.I.registerSingleton<GetFavorite>(getFavorites);

    //Inject Adapters
    GetIt.I.registerSingleton<HttpAdapter>(HttpDio(Dio()));
  }
}
