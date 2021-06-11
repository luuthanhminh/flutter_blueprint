// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'components_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ComponentsStateTearOff {
  const _$ComponentsStateTearOff();

  _ComponentsState call(List<Component> components) {
    return _ComponentsState(
      components,
    );
  }
}

/// @nodoc
const $ComponentsState = _$ComponentsStateTearOff();

/// @nodoc
mixin _$ComponentsState {
  List<Component> get components => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComponentsStateCopyWith<ComponentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComponentsStateCopyWith<$Res> {
  factory $ComponentsStateCopyWith(
          ComponentsState value, $Res Function(ComponentsState) then) =
      _$ComponentsStateCopyWithImpl<$Res>;
  $Res call({List<Component> components});
}

/// @nodoc
class _$ComponentsStateCopyWithImpl<$Res>
    implements $ComponentsStateCopyWith<$Res> {
  _$ComponentsStateCopyWithImpl(this._value, this._then);

  final ComponentsState _value;
  // ignore: unused_field
  final $Res Function(ComponentsState) _then;

  @override
  $Res call({
    Object? components = freezed,
  }) {
    return _then(_value.copyWith(
      components: components == freezed
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as List<Component>,
    ));
  }
}

/// @nodoc
abstract class _$ComponentsStateCopyWith<$Res>
    implements $ComponentsStateCopyWith<$Res> {
  factory _$ComponentsStateCopyWith(
          _ComponentsState value, $Res Function(_ComponentsState) then) =
      __$ComponentsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Component> components});
}

/// @nodoc
class __$ComponentsStateCopyWithImpl<$Res>
    extends _$ComponentsStateCopyWithImpl<$Res>
    implements _$ComponentsStateCopyWith<$Res> {
  __$ComponentsStateCopyWithImpl(
      _ComponentsState _value, $Res Function(_ComponentsState) _then)
      : super(_value, (v) => _then(v as _ComponentsState));

  @override
  _ComponentsState get _value => super._value as _ComponentsState;

  @override
  $Res call({
    Object? components = freezed,
  }) {
    return _then(_ComponentsState(
      components == freezed
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as List<Component>,
    ));
  }
}

/// @nodoc

class _$_ComponentsState implements _ComponentsState {
  const _$_ComponentsState(this.components);

  @override
  final List<Component> components;

  @override
  String toString() {
    return 'ComponentsState(components: $components)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ComponentsState &&
            (identical(other.components, components) ||
                const DeepCollectionEquality()
                    .equals(other.components, components)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(components);

  @JsonKey(ignore: true)
  @override
  _$ComponentsStateCopyWith<_ComponentsState> get copyWith =>
      __$ComponentsStateCopyWithImpl<_ComponentsState>(this, _$identity);
}

abstract class _ComponentsState implements ComponentsState {
  const factory _ComponentsState(List<Component> components) =
      _$_ComponentsState;

  @override
  List<Component> get components => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ComponentsStateCopyWith<_ComponentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
