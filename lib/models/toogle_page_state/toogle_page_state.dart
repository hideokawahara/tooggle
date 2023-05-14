//Packages
import 'package:tooggle/packages/packages_export.dart';

part 'toogle_page_state.freezed.dart';

@freezed
class TogglePageState with _$TogglePageState {
  const factory TogglePageState({
    @Default(false) bool isOn,
    @Default(TapFeedBack.weak) TapFeedBack selectFeedBack,
    @Default(ToggleColor.green) ToggleColor selectColor,
    @Default(200) double toggleSize,
    @Default(false) bool popUpStatus,
    @Default('オフにしてもいいでしょうか？') String popupText,
    @Default(Offset(0, 0)) Offset position,
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
