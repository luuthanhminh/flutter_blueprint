import 'package:domain/domain.dart';
import 'package:domain/src/entities/component.dart';
import 'package:domain/src/repositories/components_repository.dart';

class FetchComponentsUseCase extends BaseUseCase<List<Component>, void> {

  final ComponentsRespository _componentsRespository;
  FetchComponentsUseCase(this._componentsRespository);

  @override
  Future<List<Component>> perform({void param}) async {
    try
    {
      final components = await _componentsRespository.getComponents();
      return components;
    }catch (e) {
      return [];
    }
  }

  
}