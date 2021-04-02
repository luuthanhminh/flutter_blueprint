import 'package:fl_blueprint/services/navigation_service.dart';
import 'package:fl_blueprint/widgets/loading_indicator/circle_indicator.dart';
import 'package:flutter/material.dart';

abstract class IDialogService {
  Future showLoading();
  void hideLoading();
}

class DialogService implements IDialogService {

  final NavigationService _navigationService;
  DialogService(this._navigationService);

  bool _isShowLoading = false;

  @override
  void hideLoading() {
    if(_isShowLoading){
      _navigationService.goBack();
    }
   _isShowLoading = false;
  }

  @override
  Future showLoading() async{
    _isShowLoading = true;
    await showDialog(context: NavigationService.navigationKey.currentContext, builder: (_){
      return Container(child: 
      FadingCircle(
        color: Colors.blueAccent,
        size: 50.0,
      ));
    });
  }

}