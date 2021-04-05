import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:fl_blueprint/services/dialog_service.dart';
import 'package:fl_blueprint/services/navigation_service.dart';
import 'package:fl_blueprint/view_models/cards_viewmodel.dart';
import 'package:fl_blueprint/view_models/components_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());

  // Respositories and Data sources
  locator.registerFactory<ICardsDataSource>(() => LocalCardsDataSourceImpl());
  locator.registerLazySingleton<CardsRespository>(
      () => CardsRepositoryImpl(locator()));
  locator.registerFactory<IComponentsDataSource>(() => LocalComponentsDataSourceImpl());
  locator.registerLazySingleton<ComponentsRespository>(
      () => ComponentsRepositoryImpl(locator()));

  // Services
  locator.registerLazySingleton<DialogService>(() => DialogServiceImpl(locator()));

  setupUseCases();

  setupViewModels();
}

void setupUseCases() {
  locator.registerFactory(() => FetchCardsUseCase(locator()));
  locator.registerFactory(() => FetchComponentsUseCase(locator()));
}

void setupViewModels() {
  locator.registerFactory(() => CardsViewModel(locator(), locator(), locator()));
  locator.registerFactory(() => ComponentsViewModel(locator(), locator(), locator()));
}
