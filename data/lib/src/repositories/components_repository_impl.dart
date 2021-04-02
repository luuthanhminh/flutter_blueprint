import 'package:data/data.dart';
import 'package:domain/domain.dart';

class ComponentsRepositoryImpl extends ComponentsRespository {

  final IComponentsDataSource _componentsDataSource;
  ComponentsRepositoryImpl(this._componentsDataSource);

  @override
  Future<List<ComponentModel>> getComponents() async {
    final result = await _componentsDataSource.getComponents();
    return result;
  }
   
}