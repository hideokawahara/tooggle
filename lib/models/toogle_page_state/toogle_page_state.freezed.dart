// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toogle_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TogglePageState {
  bool get isOn => throw _privateConstructorUsedError;
  TapFeedBack get selectFeedBack => throw _privateConstructorUsedError;
  ToggleColor get selectColor => throw _privateConstructorUsedError;
  double get toggleSize => throw _privateConstructorUsedError;
  bool get popUpStatus => throw _privateConstructorUsedError;
  String get popupText => throw _privateConstructorUsedError;
  Offset get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TogglePageStateCopyWith<TogglePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TogglePageStateCopyWith<$Res> {
  factory $TogglePageStateCopyWith(
          TogglePageState value, $Res Function(TogglePageState) then) =
      _$TogglePageStateCopyWithImpl<$Res, TogglePageState>;
  @useResult
  $Res call(
      {bool isOn,
      TapFeedBack selectFeedBack,
      ToggleColor selectColor,
      double toggleSize,
      bool popUpStatus,
      String popupText,
      Offset position});
}

/// @nodoc
class _$TogglePageStateCopyWithImpl<$Res, $Val extends TogglePageState>
    implements $TogglePageStateCopyWith<$Res> {
  _$TogglePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOn = null,
    Object? selectFeedBack = null,
    Object? selectColor = null,
    Object? toggleSize = null,
    Object? popUpStatus = null,
    Object? popupText = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      isOn: null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
      selectFeedBack: null == selectFeedBack
          ? _value.selectFeedBack
          : selectFeedBack // ignore: cast_nullable_to_non_nullable
              as TapFeedBack,
      selectColor: null == selectColor
          ? _value.selectColor
          : selectColor // ignore: cast_nullable_to_non_nullable
              as ToggleColor,
      toggleSize: null == toggleSize
          ? _value.toggleSize
          : toggleSize // ignore: cast_nullable_to_non_nullable
              as double,
      popUpStatus: null == popUpStatus
          ? _value.popUpStatus
          : popUpStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      popupText: null == popupText
          ? _value.popupText
          : popupText // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TooglePageStateCopyWith<$Res>
    implements $TogglePageStateCopyWith<$Res> {
  factory _$$_TooglePageStateCopyWith(
          _$_TooglePageState value, $Res Function(_$_TooglePageState) then) =
      __$$_TooglePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isOn,
      TapFeedBack selectFeedBack,
      ToggleColor selectColor,
      double toggleSize,
      bool popUpStatus,
      String popupText,
      Offset position});
}

/// @nodoc
class __$$_TooglePageStateCopyWithImpl<$Res>
    extends _$TogglePageStateCopyWithImpl<$Res, _$_TooglePageState>
    implements _$$_TooglePageStateCopyWith<$Res> {
  __$$_TooglePageStateCopyWithImpl(
      _$_TooglePageState _value, $Res Function(_$_TooglePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOn = null,
    Object? selectFeedBack = null,
    Object? selectColor = null,
    Object? toggleSize = null,
    Object? popUpStatus = null,
    Object? popupText = null,
    Object? position = null,
  }) {
    return _then(_$_TooglePageState(
      isOn: null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
      selectFeedBack: null == selectFeedBack
          ? _value.selectFeedBack
          : selectFeedBack // ignore: cast_nullable_to_non_nullable
              as TapFeedBack,
      selectColor: null == selectColor
          ? _value.selectColor
          : selectColor // ignore: cast_nullable_to_non_nullable
              as ToggleColor,
      toggleSize: null == toggleSize
          ? _value.toggleSize
          : toggleSize // ignore: cast_nullable_to_non_nullable
              as double,
      popUpStatus: null == popUpStatus
          ? _value.popUpStatus
          : popUpStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      popupText: null == popupText
          ? _value.popupText
          : popupText // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$_TooglePageState implements _TooglePageState {
  const _$_TooglePageState(
      {this.isOn = false,
      this.selectFeedBack = TapFeedBack.weak,
      this.selectColor = ToggleColor.green,
      this.toggleSize = AppConfig.defaultDefaultSize,
      this.popUpStatus = false,
      this.popupText = 'オフにしてもいいでしょうか？',
      this.position = const Offset(0, 0)});

  @override
  @JsonKey()
  final bool isOn;
  @override
  @JsonKey()
  final TapFeedBack selectFeedBack;
  @override
  @JsonKey()
  final ToggleColor selectColor;
  @override
  @JsonKey()
  final double toggleSize;
  @override
  @JsonKey()
  final bool popUpStatus;
  @override
  @JsonKey()
  final String popupText;
  @override
  @JsonKey()
  final Offset position;

  @override
  String toString() {
    return 'TogglePageState(isOn: $isOn, selectFeedBack: $selectFeedBack, selectColor: $selectColor, toggleSize: $toggleSize, popUpStatus: $popUpStatus, popupText: $popupText, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TooglePageState &&
            (identical(other.isOn, isOn) || other.isOn == isOn) &&
            (identical(other.selectFeedBack, selectFeedBack) ||
                other.selectFeedBack == selectFeedBack) &&
            (identical(other.selectColor, selectColor) ||
                other.selectColor == selectColor) &&
            (identical(other.toggleSize, toggleSize) ||
                other.toggleSize == toggleSize) &&
            (identical(other.popUpStatus, popUpStatus) ||
                other.popUpStatus == popUpStatus) &&
            (identical(other.popupText, popupText) ||
                other.popupText == popupText) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOn, selectFeedBack,
      selectColor, toggleSize, popUpStatus, popupText, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TooglePageStateCopyWith<_$_TooglePageState> get copyWith =>
      __$$_TooglePageStateCopyWithImpl<_$_TooglePageState>(this, _$identity);
}

abstract class _TooglePageState implements TogglePageState {
  const factory _TooglePageState(
      {final bool isOn,
      final TapFeedBack selectFeedBack,
      final ToggleColor selectColor,
      final double toggleSize,
      final bool popUpStatus,
      final String popupText,
      final Offset position}) = _$_TooglePageState;

  @override
  bool get isOn;
  @override
  TapFeedBack get selectFeedBack;
  @override
  ToggleColor get selectColor;
  @override
  double get toggleSize;
  @override
  bool get popUpStatus;
  @override
  String get popupText;
  @override
  Offset get position;
  @override
  @JsonKey(ignore: true)
  _$$_TooglePageStateCopyWith<_$_TooglePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
