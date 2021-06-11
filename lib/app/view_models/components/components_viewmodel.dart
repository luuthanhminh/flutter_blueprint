import 'package:fl_blueprint/app/core/app_router.dart';
import 'package:fl_blueprint/app/services/dialog_service.dart';
import 'package:fl_blueprint/app/services/navigation_service.dart';
import 'package:fl_blueprint/app/view_models/base/base_viewmodel.dart';
import 'package:fl_blueprint/domain/domain.dart';
import 'package:fl_blueprint/setup.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components_state.dart';


/// Provider hold the logic for Components page
final componentsViewModelProvider =
    StateNotifierProvider.autoDispose<ComponentsViewModel, ComponentsState>(
        (ref) => locator.get<ComponentsViewModel>());

/// {@template components_view_model}
/// A view model to manage the presentation logic for [ComponentsPage]
/// {@endtemplate}
class ComponentsViewModel extends BaseViewModel<ComponentsState> {
  /// [FetchComponentsUseCase] use for fetching component collection
  final FetchComponentsUseCase _fetchComponentsUseCase;

  /// {@marco components_view_model}
  ComponentsViewModel(NavigationService navigationService,
      DialogService dialogService, this._fetchComponentsUseCase)
      : super(ComponentsState([]),navigationService, dialogService);

  

  /// Initialize data at the first time
  Future initialize() async {
    try {
      dialogService.showLoading();

      final result = await _fetchComponentsUseCase.perform();
      state = state.copyWith(components: [...result]);

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
