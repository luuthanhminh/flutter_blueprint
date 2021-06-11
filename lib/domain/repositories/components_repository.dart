
import 'package:fl_blueprint/domain/domain.dart';

abstract class ComponentsRespository {
  Future<List<Component>> getComponents();
}