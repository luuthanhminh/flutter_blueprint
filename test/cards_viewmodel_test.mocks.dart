import 'package:mockito/mockito.dart' as _i1;
import 'package:fl_blueprint/services/navigation_service.dart' as _i2;
import 'dart:async' as _i3;
import 'package:flutter/src/widgets/navigator.dart' as _i4;
import 'package:fl_blueprint/services/dialog_service.dart' as _i5;
import 'package:domain/src/usecases/fetch_cards_usecase.dart' as _i6;
import 'package:domain/src/entities/card.dart' as _i7;

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i2.NavigationService {
  MockNavigationService() {
    _i1.throwOnMissingStub(this);
  }

  _i3.Future<T?> pushNamed<T extends Object>(String? routeName,
          {Object? args}) =>
      super.noSuchMethod(
          Invocation.method(#pushNamed, [routeName], {#args: args}),
          Future.value(null));
  _i3.Future<T?> push<T extends Object>(_i4.Route<T>? route) =>
      super.noSuchMethod(Invocation.method(#push, [route]), Future.value(null));
  _i3.Future<T?> pushReplacementNamed<T extends Object, TO extends Object>(
          String? routeName,
          {Object? args}) =>
      super.noSuchMethod(
          Invocation.method(#pushReplacementNamed, [routeName], {#args: args}),
          Future.value(null));
  _i3.Future<T?> pushNamedAndRemoveUntil<T extends Object>(String? routeName,
          {Object? args, bool Function(_i4.Route<dynamic>)? predicate}) =>
      super.noSuchMethod(
          Invocation.method(#pushNamedAndRemoveUntil, [routeName],
              {#args: args, #predicate: predicate}),
          Future.value(null));
  _i3.Future<T?> pushAndRemoveUntil<T extends Object>(_i4.Route<T>? route,
          {bool Function(_i4.Route<dynamic>)? predicate}) =>
      super.noSuchMethod(
          Invocation.method(
              #pushAndRemoveUntil, [route], {#predicate: predicate}),
          Future.value(null));
  _i3.Future<bool> maybePop<T extends Object>([Object? args]) => super
      .noSuchMethod(Invocation.method(#maybePop, [args]), Future.value(false));
  bool canPop() => super.noSuchMethod(Invocation.method(#canPop, []), false);
  void popUntil(String? route) =>
      super.noSuchMethod(Invocation.method(#popUntil, [route]));
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i5.DialogService {
  MockDialogService() {
    _i1.throwOnMissingStub(this);
  }

  _i3.Future<dynamic> showLoading() => super
      .noSuchMethod(Invocation.method(#showLoading, []), Future.value(null));
}

/// A class which mocks [FetchCardsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchCardsUseCase extends _i1.Mock implements _i6.FetchCardsUseCase {
  MockFetchCardsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  _i3.Future<List<_i7.Card>> perform({void param}) => super.noSuchMethod(
      Invocation.method(#perform, [], {#param: param}),
      Future.value(<_i7.Card>[]));
}
