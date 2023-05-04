// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_app_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomAppPageState {
  List<TogglePageState> get toggle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomAppPageStateCopyWith<CustomAppPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomAppPageStateCopyWith<$Res> {
  factory $CustomAppPageStateCopyWith(
          CustomAppPageState value, $Res Function(CustomAppPageState) then) =
      _$CustomAppPageStateCopyWithImpl<$Res, CustomAppPageState>;
  @useResult
  $Res call({List<TogglePageState> toggle});
}

/// @nodoc
class _$CustomAppPageStateCopyWithImpl<$Res, $Val extends CustomAppPageState>
    implements $CustomAppPageStateCopyWith<$Res> {
  _$CustomAppPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toggle = null,
  }) {
    return _then(_value.copyWith(
      toggle: null == toggle
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as List<TogglePageState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomAppPageStateCopyWith<$Res>
    implements $CustomAppPageStateCopyWith<$Res> {
  factory _$$_CustomAppPageStateCopyWith(_$_CustomAppPageState value,
          $Res Function(_$_CustomAppPageState) then) =
      __$$_CustomAppPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TogglePageState> toggle});
}

/// @nodoc
class __$$_CustomAppPageStateCopyWithImpl<$Res>
    extends _$CustomAppPageStateCopyWithImpl<$Res, _$_CustomAppPageState>
    implements _$$_CustomAppPageStateCopyWith<$Res> {
  __$$_CustomAppPageStateCopyWithImpl(
      _$_CustomAppPageState _value, $Res Function(_$_CustomAppPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toggle = null,
  }) {
    return _then(_$_CustomAppPageState(
      toggle: null == toggle
          ? _value._toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as List<TogglePageState>,
    ));
  }
}

/// @nodoc

class _$_CustomAppPageState implements _CustomAppPageState {
  const _$_CustomAppPageState(
      {final List<TogglePageState> toggle = const [
        TogglePageState(),
        TogglePageState()
      ]})
      : _toggle = toggle;

  final List<TogglePageState> _toggle;
  @override
  @JsonKey()
  List<TogglePageState> get toggle {
    if (_toggle is EqualUnmodifiableListView) return _toggle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toggle);
  }

  @override
  String toString() {
    return 'CustomAppPageState(toggle: $toggle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomAppPageState &&
            const DeepCollectionEquality().equals(other._toggle, _toggle));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_toggle));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomAppPageStateCopyWith<_$_CustomAppPageState> get copyWith =>
      __$$_CustomAppPageStateCopyWithImpl<_$_CustomAppPageState>(
          this, _$identity);
}

abstract class _CustomAppPageState implements CustomAppPageState {
  const factory _CustomAppPageState({final List<TogglePageState> toggle}) =
      _$_CustomAppPageState;

  @override
  List<TogglePageState> get toggle;
  @override
  @JsonKey(ignore: true)
  _$$_CustomAppPageStateCopyWith<_$_CustomAppPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
