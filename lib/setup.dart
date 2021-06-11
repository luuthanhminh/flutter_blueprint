import 'package:fl_blueprint/app/services/dialog_service.dart';
import 'package:fl_blueprint/app/services/navigation_service.dart';
import 'package:fl_blueprint/data/data.dart';
import 'package:fl_blueprint/domain/domain.dart';
import 'package:get_it/get_it.dart';

import 'app/view_models/view_models.dart';

/// Ioc instance
GetIt locator = GetIt.instance;

/// Setup dependencies in application
Future setupLocator() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  // Respositories and Data sources
  locator.registerFactory<CardsDataSource>(() => LocalCardsDataSourceImpl());
  locator.registerLazySingleton<CardsRespository>(
      () => CardsRepositoryImpl(locator()));
  locator.registerFactory<ComponentsDataSource>(
      () => LocalComponentsDataSourceImpl());
  locator.registerLazySingleton<ComponentsRespository>(
      () => ComponentsRepositoryImpl(locator()));

  // Services
  locator
      .registerLazySingleton<DialogService>(() => DialogServiceImpl(locator()));

  _setupUseCases();

  _setupViewModels();
}

/// Register all use cases in IoC
void _setupUseCases() {
  locator.registerFactory(() => FetchCardsUseCase(locator()));
  locator.registerFactory(() => FetchComponentsUseCase(locator()));
}

/// Register all view models in IoC
void _setupViewModels() {
  locator
      .registerFactory(() => CardsViewModel(locator(), locator(), locator()));
  locator.registerFactory(
      () => ComponentsViewModel(locator(), locator(), locator()));
}
