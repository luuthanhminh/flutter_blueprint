import 'package:fl_blueprint/app/core/app_router.dart';
import 'package:fl_blueprint/app/services/dialog_service.dart';
import 'package:fl_blueprint/app/services/navigation_service.dart';
import 'package:fl_blueprint/app/view_models/view_models.dart';
import 'package:fl_blueprint/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'components_viewmodel_test.mocks.dart';

@GenerateMocks([NavigationService])
@GenerateMocks([DialogService])
@GenerateMocks([FetchComponentsUseCase])
void main() {
  var mockDialogService = MockDialogService();
  var mockFetchComponentsUseCase = MockFetchComponentsUseCase();
  var mockNavigationService = MockNavigationService();
  group('Components ViewModel', () {
    setUpAll(() async {
      mockNavigationService = MockNavigationService();
      mockFetchComponentsUseCase = MockFetchComponentsUseCase();
      mockDialogService = MockDialogService();

      when(mockDialogService.showLoading()).thenAnswer((_) async {});
      when(mockDialogService.hideLoading()).thenAnswer((_) {});
      when(mockNavigationService.pushNamed(any))
          .thenAnswer((_) => Future.value());
      when(mockNavigationService.pushNamed(any, args: anyNamed('args')))
          .thenAnswer((_) => Future.value());
    });
    test('Should have components if fetching componenets success', () async {
      // Arrange
      final componentsViewModel = ComponentsViewModel(
          mockNavigationService, mockDialogService, mockFetchComponentsUseCase);
      when(mockFetchComponentsUseCase.perform()).thenAnswer((_) async {
        final components = [
          Component(text: '', url: ''),
          Component(text: '', url: '')
        ];
        return components;
      });

      // Act
      await componentsViewModel.initialize();

      // Assert
      expect(componentsViewModel.debugState.components.length, 2);
    });
    test('Should have no components if fetching componenets throws exception',
        () async {
      // Arrange
      final componentsViewModel = ComponentsViewModel(
          mockNavigationService, mockDialogService, mockFetchComponentsUseCase);
      when(mockFetchComponentsUseCase.perform()).thenThrow(Exception());

      // Act
      await componentsViewModel.initialize();

      // Assert
      expect(componentsViewModel.debugState.components.length, 0);
    });
    test('Should navigate to In-app browser if url is not empty', () async {
      // Arrange
      final componentsViewModel = ComponentsViewModel(
          mockNavigationService, mockDialogService, mockFetchComponentsUseCase);
      when(mockFetchComponentsUseCase.perform()).thenThrow(Exception());
      final url = 'https://flutter.dev/';
      // Act
      componentsViewModel.openUrl(url);

      // Assert
      verify(mockNavigationService.pushNamed(AppRoute.inAppWebViewPage,
              args: url))
          .called(1);
    });
    test('Should not navigate to In-app browser if url is empty', () async {
      // Arrange
      final componentsViewModel = ComponentsViewModel(
          mockNavigationService, mockDialogService, mockFetchComponentsUseCase);
      when(mockFetchComponentsUseCase.perform()).thenThrow(Exception());
      final url = '';
      // Act
      componentsViewModel.openUrl(url);

      // Assert
      verifyNever(mockNavigationService.pushNamed(AppRoute.inAppWebViewPage,
          args: url));
    });
  });
}
