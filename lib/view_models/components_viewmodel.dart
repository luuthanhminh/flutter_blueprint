import 'package:domain/domain.dart';
import 'package:fl_blueprint/app/app_router.dart';
import 'package:fl_blueprint/app/setup_locator.dart';
import 'package:fl_blueprint/services/navigation_service.dart';
import 'package:fl_blueprint/services/dialog_service.dart';
import 'package:fl_blueprint/view_models/base/base_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Exposes for UI
final componentsViewModelProvider =
    AutoDisposeChangeNotifierProvider((ref) => locator.get<ComponentsViewModel>());

final componentsProvider = Provider.autoDispose((ref) => ref.watch(componentsViewModelProvider).components);

// Presentation logic
class ComponentsViewModel extends BaseViewModel {
  // Use cases
  final FetchComponentsUseCase _fetchComponentsUseCase;

  ComponentsViewModel(NavigationService navigationService,
      DialogService dialogService, this._fetchComponentsUseCase)
      : super(navigationService, dialogService);

  List<Component> components = [];

  Future initialize() async {
    try {
      dialogService.showLoading();

      final result = await _fetchComponentsUseCase.perform();
      components = [...result];
      notifyListeners();

    } catch (e) {
      //Log error
    }
    finally {
      dialogService.hideLoading();
    }
  }

  // Commands
  void openUrl(String url){
    if(url.isNotEmpty) {
      navigationService.pushNamed(AppRoute.inAppWebViewPage,args: url);
    }
    
  }
}
