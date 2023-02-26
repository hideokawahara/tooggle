//Packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'toogle_page_state.freezed.dart';

@freezed
class TooglePageState with _$TooglePageState {
  const factory TooglePageState({
    @Default(false) bool isOn,
    @Default(TapFeedBack.weak) TapFeedBack selectFeedBack,
    @Default(ToggleColor.green) ToggleColor selectColor,
    @Default(200) double toggleSize,
    @Default(false) bool popUpStatus,
    @Default('オフにしてもいいでしょうか？') String popupText,
  }) = _TooglePageState;
}

enum TapFeedBack {
  weak,
  medium,
  strong,
  vibe,
}

enum ToggleColor {
  green,
  blue,
  red,
  pink,
}
