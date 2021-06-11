
import 'package:fl_blueprint/domain/domain.dart';

abstract class CardsRespository {
  Future<List<DCard>> getCards();
}