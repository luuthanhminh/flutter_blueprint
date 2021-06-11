import 'package:fl_blueprint/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'components_state.freezed.dart';

@freezed
class ComponentsState with _$ComponentsState {
  const factory ComponentsState(List<Component> components) = _ComponentsState;
}