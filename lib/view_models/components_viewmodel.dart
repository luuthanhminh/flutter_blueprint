import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../app/app_router.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import 'base/base_viewmodel.dart';


/// {@template components_view_model}
/// A view model to manage the presentation logic for [ComponentsPage]
/// {@endtemplate}
class ComponentsViewModel extends BaseViewModel {
  /// [FetchComponentsUseCase] use for fetching component collection
  final FetchComponentsUseCase _fetchComponentsUseCase;

  /// {@marco components_view_model}
  ComponentsViewModel(NavigationService navigationService,
      DialogService dialogService, this._fetchComponentsUseCase)
      : super(navigationService, dialogService);

  /// Collection of component
  List<Component> components = [];

  /// Initialize data at the first time
  Future initialize() async {
    try {
      dialogService.showLoading();

      final result = await _fetchComponentsUseCase.perform();
      components = [...result];
      notifyListeners();

    } on Exception catch (e) {
      // Log error
      debugPrint(e.toString());
    }
    finally {
      dialogService.hideLoading();
    }
  }

  /// Open a webview with a url
  void openUrl(String url){
    if(url.isNotEmpty) {
      navigationService.pushNamed(AppRoute.inAppWebViewPage,args: url);
    }
  }
}
