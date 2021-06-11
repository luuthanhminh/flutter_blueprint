
import 'package:fl_blueprint/data/data.dart';
import 'package:fl_blueprint/domain/domain.dart';

class CardsRepositoryImpl extends CardsRespository {

  final CardsDataSource _cardsDataSource;
  CardsRepositoryImpl(this._cardsDataSource);

  @override
  Future<List<DCard>> getCards() async {
    final cards = await _cardsDataSource.getCards();
    return cards;
  }
   
}