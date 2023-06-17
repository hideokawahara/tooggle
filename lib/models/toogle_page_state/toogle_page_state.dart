//Packages
import 'package:tooggle/packages/packages_export.dart';

//Resources
import 'package:tooggle/resources/resources_export.dart';

part 'toogle_page_state.freezed.dart';

@freezed
class TogglePageState with _$TogglePageState {
  const factory TogglePageState({
    @Default(false) bool isOn,
    @Default(TapFeedBack.weak) TapFeedBack selectFeedBack,
    @Default(ToggleColor.green) ToggleColor selectColor,
    @Default(AppConfigs.defaultDefaultSize) double toggleSize,
    @Default(false) bool popUpStatus,
    @Default('オフにしてもいいでしょうか？') String popupText,
    @Default(AppConfigs.defaultPosition) Offset position,
    @Default(true) bool applyMasterSettings,
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
