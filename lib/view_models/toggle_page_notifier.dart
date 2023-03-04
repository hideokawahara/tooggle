//Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Models
import 'package:tooggle/models/toogle_page_state/toogle_page_state.dart';

class TogglePageNotifier extends StateNotifier<TogglePageState> {
  TogglePageNotifier() : super(const TogglePageState());

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
    state = state.copyWith(toggleSize: value);
  }

  void changePopUpStatus(bool value) {
    state = state.copyWith(popUpStatus: value);
  }

  void changePopUpText(String value) {
    state = state.copyWith(popupText: value);
  }
}

final togglePageProvider =
    StateNotifierProvider.autoDispose<TogglePageNotifier, TogglePageState>(
  (_) => TogglePageNotifier(),
);
