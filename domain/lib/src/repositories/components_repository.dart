import 'package:domain/src/entities/component.dart';

abstract class ComponentsRespository {
  Future<List<Component>> getComponents();
}