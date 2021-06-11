import 'dart:convert';

import 'package:fl_blueprint/data/data.dart';
import 'package:flutter/services.dart';


abstract class CardsDataSource {
  Future<List<CardModel>> getCards();
}

class LocalCardsDataSourceImpl extends CardsDataSource {

  final fileSource = 'assets/data/cards.json';

  @override
  Future<List<CardModel>> getCards() async {
    // Return data after 2 seconds
    await Future.delayed(Duration(seconds: 2));
    final json = await rootBundle.loadString(fileSource);
    final decodedData = jsonDecode(json);
    return (decodedData as List).map((e) => CardModel.fromJson(e)).toList();
  }
}