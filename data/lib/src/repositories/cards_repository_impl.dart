import 'package:data/src/datasources/cards_data_source.dart';
import 'package:domain/domain.dart';

class CardsRepositoryImpl extends CardsRespository {

  final ICardsDataSource _cardsDataSource;
  CardsRepositoryImpl(this._cardsDataSource);

  @override
  Future<List<Card>> getCards() async {
    final cards = await _cardsDataSource.getCards();
    return cards;
  }
   
}