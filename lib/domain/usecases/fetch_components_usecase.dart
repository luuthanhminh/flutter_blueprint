
import 'package:fl_blueprint/domain/domain.dart';

class FetchComponentsUseCase extends BaseUseCase<List<Component>, Object?> {

  final ComponentsRespository _componentsRespository;
  FetchComponentsUseCase(this._componentsRespository);

  @override
  Future<List<Component>> perform({Object? param}) async {
    try
    {
      final components = await _componentsRespository.getComponents();
      return components;
    } on Exception catch (_) {
      return [];
    }
  }

  
}