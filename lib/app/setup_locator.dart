import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import '../view_models/cards_viewmodel.dart';
import '../view_models/components_viewmodel.dart';

/// Ioc instance
GetIt locator = GetIt.instance;

/// Setup dependencies in application
Future setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());

  // Respositories and Data sources
  locator.registerFactory<ICardsDataSource>(() => LocalCardsDataSourceImpl());
  locator.registerLazySingleton<CardsRespository>(
      () => CardsRepositoryImpl(locator()));
  locator.registerFactory<IComponentsDataSource>(
      () => LocalComponentsDataSourceImpl());
  locator.registerLazySingleton<ComponentsRespository>(
      () => ComponentsRepositoryImpl(locator()));

  // Services
  locator
      .registerLazySingleton<DialogService>(() => DialogServiceImpl(locator()));

  setupUseCases();

  setupViewModels();
}
/// Register all use cases in IoC
void setupUseCases() {
  locator.registerFactory(() => FetchCardsUseCase(locator()));
  locator.registerFactory(() => FetchComponentsUseCase(locator()));
}

/// Register all view models in IoC
void setupViewModels() {
  locator
      .registerFactory(() => CardsViewModel(locator(), locator(), locator()));
  locator.registerFactory(
      () => ComponentsViewModel(locator(), locator(), locator()));
}
