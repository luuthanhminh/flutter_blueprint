import 'package:fl_blueprint/app/core/app_router.dart';
import 'package:fl_blueprint/domain/domain.dart';
import 'package:fl_blueprint/setup.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/dialog_service.dart';
import '../../services/navigation_service.dart';

import '../base/base_viewmodel.dart';
import 'card_state.dart';

/// Define providers to use for Card page
final cardsViewModelProvider =
    StateNotifierProvider.autoDispose<CardsViewModel, CardState>(
        (ref) => locator.get<CardsViewModel>());

/// {@template cards_view_model}
/// A view model to manage the presentation logic for [CardsPage]
/// {@endtemplate}
class CardsViewModel extends BaseViewModel<CardState> {
  /// [FetchCardsUseCase] use for fecting card collection
  final FetchCardsUseCase _fetchCardsUseCase;

  /// {@marco cards_view_model}
  CardsViewModel(NavigationService navigationService,
      DialogService dialogService, this._fetchCardsUseCase)
      : super(CardState([], ''), navigationService, dialogService);

  /// Initialize data at the first time
  Future initialize() async {
    try {
      dialogService.showLoading();

      final result = await _fetchCardsUseCase.perform();
      //state = state.cop
      state = state.copyWith(cards: [...result]);
    } on Exception catch (e) {
      // Log error
      debugPrint(e.toString());
    } finally {
      dialogService.hideLoading();
    }
  }

  /// Navigate to Screen 2 page
  void navigateToScreen2() async {
    await navigationService.pushNamed(AppRoute.screen2Page);
  }

  /// Navigate to Components page
  void navigateToComponentsPage() async {
    await navigationService.pushNamed(AppRoute.componentsPage);
  }
}
