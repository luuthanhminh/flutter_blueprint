import 'package:fl_blueprint/app/core/app_router.dart';
import 'package:fl_blueprint/app/services/dialog_service.dart';
import 'package:fl_blueprint/app/services/navigation_service.dart';
import 'package:fl_blueprint/app/view_models/view_models.dart';
import 'package:fl_blueprint/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cards_viewmodel_test.mocks.dart';

@GenerateMocks([NavigationService])
@GenerateMocks([DialogService])
@GenerateMocks([FetchCardsUseCase])
void main() {
  var mockDialogService = MockDialogService();
  var mockFetchCardsUseCase = MockFetchCardsUseCase();
  var mockNavigationService = MockNavigationService();
  group('Cards ViewModel', () {
    setUpAll(() async {
      mockNavigationService = MockNavigationService();
      mockFetchCardsUseCase = MockFetchCardsUseCase();
      mockDialogService = MockDialogService();

      when(mockDialogService.showLoading()).thenAnswer((_) async {});
      when(mockDialogService.hideLoading()).thenAnswer((_) {});
      when(mockNavigationService.pushNamed(any))
          .thenAnswer((_) => Future.value());
    });
    test('Should have cards if fetching cards success', () async {
      // Arrange
      final cardsViewModel = CardsViewModel(
          mockNavigationService, mockDialogService, mockFetchCardsUseCase);
      when(mockFetchCardsUseCase.perform()).thenAnswer((_) async {
        final cards = [
          DCard(header: '', description: '', images: []),
          DCard(header: '', description: '', images: [])
        ];
        return cards;
      });

      // Act
      await cardsViewModel.initialize();

      // Assert
      expect(cardsViewModel.debugState.cards.length, 2);
    });
    test('Should have no cards if fetching cards throws exception', () async {
      // Arrange
      final cardsViewModel = CardsViewModel(
          mockNavigationService, mockDialogService, mockFetchCardsUseCase);
      when(mockFetchCardsUseCase.perform()).thenThrow(Exception());

      // Act
      await cardsViewModel.initialize();

      // Assert
      expect(cardsViewModel.debugState.cards.length, 0);
    });

    test(
        '''Should navigation to Screen 2 when navigateToScreen2 function is excuted''',
        () async {
      // Arrange
      final cardsViewModel = CardsViewModel(
          mockNavigationService, mockDialogService, mockFetchCardsUseCase);
      // Act
      cardsViewModel.navigateToScreen2();

      // Assert
      verify(mockNavigationService.pushNamed(AppRoute.screen2Page)).called(1);
    });
    test(
        '''Should navigation to Components Page when navigateToComponentsPage function is excuted''',
        () async {
      // Arrange
      final cardsViewModel = CardsViewModel(
          mockNavigationService, mockDialogService, mockFetchCardsUseCase);
      // Act
      cardsViewModel.navigateToComponentsPage();

      // Assert
      verify(mockNavigationService.pushNamed(AppRoute.componentsPage))
          .called(1);
    });
  });
}
