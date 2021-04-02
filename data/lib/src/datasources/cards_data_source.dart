import 'dart:convert';

import 'package:data/src/models/card_model.dart';
import 'package:flutter/services.dart';


abstract class ICardsDataSource {
  Future<List<CardModel>> getCards();
}

class LocalCardsDataSourceImpl extends ICardsDataSource {

  final file_source = 'assets/data/cards.json';

  @override
  Future<List<CardModel>> getCards() async {
    // Return data after 2 seconds
    await Future.delayed(Duration(seconds: 2));
    final json = await rootBundle.loadString(file_source);
    final decodedData = jsonDecode(json);
    return (decodedData as List).map((e) => CardModel.fromJson(e)).toList();
  }
}