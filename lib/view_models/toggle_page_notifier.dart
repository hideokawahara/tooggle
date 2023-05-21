//Packages
import 'package:tooggle/packages/packages_export.dart';

//Models
import 'package:tooggle/models/toogle_page_state/toogle_page_state.dart';

class TogglePageNotifier extends StateNotifier<TogglePageState> {
  TogglePageNotifier({
    this.toggleState,
  }) : super(toggleState ?? const TogglePageState());
  final TogglePageState? toggleState;

  void changeIsOnStatus(bool value) {
    state = state.copyWith(isOn: value);
  }

  void changeFeedBack(TapFeedBack value) {
    state = state.copyWith(selectFeedBack: value);
  }

  void changeToggleColor(ToggleColor value) {
    state = state.copyWith(selectColor: value);
  }

  void changeToggleSize(double value) {
    if (value < 100 || value > 300) return;
    state = state.copyWith(toggleSize: value);
  }

  void changePopUpStatus(bool value) {
    state = state.copyWith(popUpStatus: value);
  }

  void changePopUpText(String value) {
    state = state.copyWith(popupText: value);
  }

  void changeToggle(TogglePageState toggle) {
    state = toggle;
  }
}

class ToggleViewModel {
  static final masterToggleProvider =
      StateNotifierProvider<TogglePageNotifier, TogglePageState>(
    (_) => TogglePageNotifier(),
  );
}
