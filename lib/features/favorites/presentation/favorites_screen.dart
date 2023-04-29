import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:appexample/core/widgets/carditem_widget.dart';
import 'package:appexample/core/widgets/shimmer_widget.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';
import 'package:appexample/features/favorites/domain/usecases/add_favorite.dart';
import 'package:appexample/features/favorites/domain/usecases/get_favorites.dart';
import 'package:appexample/features/favorites/presentation/controller/favorites_controller.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  TextEditingController controllerURL = TextEditingController();

  Future<List<Links>> getFavorites(FavoritesController controller) async {
    Future.delayed(const Duration(seconds: 2));
    sleep(const Duration(seconds: 1));
    return controller.links;
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    final favoritesController = Provider.of<FavoritesController>(context);

    final getFavorite = GetIt.I.get<GetFavorite>();
    final addFavorite = GetIt.I.get<AddFavorite>();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 75,
                child: TextField(
                  controller: controllerURL,
                  key: const ValueKey('keyUrlSend'),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                  width: 60,
                  child: ElevatedButton(
                      key: const ValueKey('keyButtonSend'),
                      onPressed: () async {
                        final retorno = await addFavorite(controllerURL.text);
                        if (retorno.isLeft) {
                          Toast.show(retorno.left.message ?? '', duration: Toast.lengthLong, gravity: Toast.bottom);
                        } else {
                          favoritesController.add(Links(retorno.right.links.self, retorno.right.links.short));
                        }
                      },
                      child: const Icon(Icons.send)))
            ],
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 10),
            height: 40,
            child: const Text(
              'Recently shortened URLs',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: getFavorites(favoritesController),
                builder: (context, snapshot) {
                  var shimmerEffect = const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ShimmerWidget(),
                  );
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return ListView(
                        children: [
                          shimmerEffect,
                          shimmerEffect,
                          shimmerEffect,
                          shimmerEffect,
                          shimmerEffect,
                          shimmerEffect,
                          shimmerEffect,
                          shimmerEffect
                        ],
                      );

                    case ConnectionState.done:
                      if (favoritesController.links.isNotEmpty) {
                        return ListView.builder(
                            key: const ValueKey('keyListView'),
                            itemCount: favoritesController.links.length,
                            itemBuilder: (context, index) => CardItemWidget(
                                key: Key('itemListView$index'),
                                onTap: () async {
                                  final links = favoritesController.links[index];
                                  final result = await getFavorite(links.short);

                                  if (result.isLeft) {
                                    throw result.left;
                                  } else {
                                    if (!context.mounted) return;
                                    return showDialogFavorite(context, links.short, result.right.url);
                                  }
                                },
                                text: favoritesController.links[index].short));
                      } else {
                        return const Center(child: Text('Nenhuma URL salva :('));
                      }

                    default:
                      return const Center(child: Text('Algo inesperado ocorreu :('));
                  }
                }),
          )
        ]),
      ),
    );
  }

  Future<dynamic> showDialogFavorite(BuildContext context, String title, String contentText) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(contentText),
          actions: [
            ElevatedButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
