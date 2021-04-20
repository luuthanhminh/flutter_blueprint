import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';

import '../app/app_router.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import 'base/base_viewmodel.dart';

/// {@template cards_view_model}
/// A view model to manage the presentation logic for [CardsPage]
/// {@endtemplate}
class CardsViewModel extends BaseViewModel {
  /// [FetchCardsUseCase] use for fecting card collection
  final domain.FetchCardsUseCase _fetchCardsUseCase;

  /// {@marco cards_view_model}
  CardsViewModel(NavigationService navigationService,
      DialogService dialogService, this._fetchCardsUseCase)
      : super(navigationService, dialogService);
  /// Card collection
  List<domain.Card> cards = [];

  /// Initialize data at the first time
  Future initialize() async {
    try {
      dialogService.showLoading();

      final result = await _fetchCardsUseCase.perform();
      cards = [...result];
      notifyListeners();

    } on Exception catch (e) {
      // Log error
      debugPrint(e.toString());
    }
    finally {
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
