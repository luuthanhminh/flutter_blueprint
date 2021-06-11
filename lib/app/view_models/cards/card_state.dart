import 'package:fl_blueprint/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_state.freezed.dart';

///
@freezed
class CardState with _$CardState {
  ///
  const factory CardState(List<DCard> cards, String text) = _CardState;
}