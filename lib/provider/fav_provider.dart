import 'package:flutter/material.dart';
import '../widgets/home page/Cards.dart';

class fav_provider extends ChangeNotifier {
  List<ConcertCard> _cards = [];
  List<ConcertCard> get cards => _cards;

  void toggleFavorite(ConcertCard card) {
    final isExist = _cards.contains(card);

    if (isExist) {
      _cards.remove(card);
    } else {
      _cards.remove(card);
    }
    notifyListeners();
  }

  void clearFavorite() {
    _cards = [];
    notifyListeners();
  }
}
