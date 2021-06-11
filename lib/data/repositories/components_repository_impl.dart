import 'package:fl_blueprint/data/data.dart';
import 'package:fl_blueprint/domain/domain.dart';

class ComponentsRepositoryImpl extends ComponentsRespository {
  final ComponentsDataSource _componentsDataSource;
  ComponentsRepositoryImpl(this._componentsDataSource);

  @override
  Future<List<ComponentModel>> getComponents() async {
    final result = await _componentsDataSource.getComponents();
    return result;
  }
}
