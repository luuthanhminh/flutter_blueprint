import 'package:fl_blueprint/domain/domain.dart';

class FetchCardsUseCase extends BaseUseCase<List<DCard>, Object?> {
  final CardsRespository _cardsRespository;
  FetchCardsUseCase(this._cardsRespository);

  @override
  Future<List<DCard>> perform({Object? param}) async {
    try {
      final cards = await _cardsRespository.getCards();
      return cards;
    } on Exception catch (_) {
      return [];
    }
  }
}
