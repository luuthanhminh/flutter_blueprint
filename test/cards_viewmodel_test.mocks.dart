import 'package:mockito/mockito.dart' as _i1;
import 'package:fl_blueprint/services/navigation_service.dart' as _i2;
import 'package:fl_blueprint/services/dialog_service.dart' as _i3;
import 'package:domain/src/usecases/fetch_cards_usecase.dart' as _i4;

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i2.NavigationService {
  MockNavigationService() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [IDialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIDialogService extends _i1.Mock implements _i3.IDialogService {
  MockIDialogService() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [FetchCardsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchCardsUseCase extends _i1.Mock implements _i4.FetchCardsUseCase {
  MockFetchCardsUseCase() {
    _i1.throwOnMissingStub(this);
  }
}
