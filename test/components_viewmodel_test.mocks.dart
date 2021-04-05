import 'package:mockito/mockito.dart' as _i1;
import 'package:fl_blueprint/services/navigation_service.dart' as _i2;
import 'package:fl_blueprint/services/dialog_service.dart' as _i3;
import 'package:domain/src/usecases/fetch_components_usecase.dart' as _i4;

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i2.NavigationService {
  MockNavigationService() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i3.DialogService {
  MockDialogService() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [FetchComponentsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchComponentsUseCase extends _i1.Mock
    implements _i4.FetchComponentsUseCase {
  MockFetchComponentsUseCase() {
    _i1.throwOnMissingStub(this);
  }
}
