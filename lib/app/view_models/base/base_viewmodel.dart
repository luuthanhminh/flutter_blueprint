import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/dialog_service.dart';
import '../../services/navigation_service.dart';

/// {@template base_view_model}
/// A base view model which includes necessary services
/// {@endtemplate}
abstract class BaseViewModel<T> extends StateNotifier<T> {
  /// A navigation service instance which use to manage the app navigation flow
  final NavigationService navigationService;

  /// A dialog service instance which provide a way to show dialogs
  final DialogService dialogService;

  /// {@marco base_view_model}
  BaseViewModel(T state, this.navigationService, this.dialogService)
      : super(state);
}
