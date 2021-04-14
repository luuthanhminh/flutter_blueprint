import 'package:fl_blueprint/services/dialog_service.dart';
import 'package:fl_blueprint/services/navigation_service.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  final NavigationService navigationService;
  final DialogService dialogService;

  BaseViewModel(this.navigationService, this.dialogService);
}