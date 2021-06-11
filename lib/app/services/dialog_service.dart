import 'package:flutter/material.dart';
import '../widgets/loading_indicator/circle_indicator.dart';
import 'navigation_service.dart';

/// Dialog service interface
abstract class DialogService {
  /// Show a loading dialog on the current page
  Future showLoading();

  /// Hide a current loading dialog on the current page
  void hideLoading();
}

/// Implementation of [DialogService]
class DialogServiceImpl implements DialogService {
  final NavigationService _navigationService;

  /// Create new instance for dialog service
  DialogServiceImpl(this._navigationService);

  bool _isShowLoading = false;

  @override
  void hideLoading() {
    if (_isShowLoading) {
      _navigationService.goBack();
    }
    _isShowLoading = false;
  }

  @override
  Future showLoading() async {
    _isShowLoading = true;
    final currentContext = globalNavigationKey.currentContext;
    if (currentContext != null) {
      await showDialog(
          context: currentContext,
          builder: (_) {
            return Container(
                child: FadingCircle(
              color: Colors.blueAccent,
              size: 50.0,
            ));
          });
    }
  }
}
