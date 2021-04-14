import 'package:domain/domain.dart';
import 'package:fl_blueprint/app/app_router.dart';
import 'package:fl_blueprint/services/navigation_service.dart';
import 'package:fl_blueprint/services/dialog_service.dart';
import 'package:fl_blueprint/view_models/base/base_viewmodel.dart';

// Presentation logic
class CardsViewModel extends BaseViewModel {
  // Use cases
  final FetchCardsUseCase _fetchCardsUseCase;

  CardsViewModel(NavigationService navigationService,
      DialogService dialogService, this._fetchCardsUseCase)
      : super(navigationService, dialogService);

  List<Card> cards = [];

  Future initialize() async {
    try {
      dialogService.showLoading();

      final result = await _fetchCardsUseCase.perform();
      cards = [...result];
      notifyListeners();

    } catch (e) {
      //Log error
    }
    finally {
      dialogService.hideLoading();
    }
  }

  // Commands
  void navigateToScreen2() async {
    await navigationService.pushNamed(AppRoute.screen2Page);
  }

  void navigateToComponentsPage() async {
    await navigationService.pushNamed(AppRoute.componentsPage);
  }
}
