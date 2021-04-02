import 'package:domain/src/entities/card.dart';
import 'package:domain/src/repositories/cards_repository.dart';
import 'package:domain/src/usecases/base_usecase.dart';

class FetchCardsUseCase extends BaseUseCase<List<Card>, void> {

  final CardsRespository _cardsRespository;
  FetchCardsUseCase(this._cardsRespository);

  @override
  Future<List<Card>> perform({void param}) async {
    try
    {
      final cards = await _cardsRespository.getCards();
      return cards;
    }catch (e) {
      return [];
    }
  }

  
}