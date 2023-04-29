import 'package:flutter/material.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';

class FavoritesController extends ChangeNotifier {
  List<Links> _links = [];

  List<Links> get links => _links;

  set favorites(List<Links> value) {
    _links = value;
    notifyListeners();
  }

  add(Links links) {
    _links.add(links);
    notifyListeners();
  }
}
