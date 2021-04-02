import 'package:domain/src/entities/card.dart';

abstract class CardsRespository {
  Future<List<Card>> getCards();
}