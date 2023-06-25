//Packages
import 'package:tooggle/packages/packages_export.dart';

//Models
import 'package:tooggle/models/models_export.dart';

class CustomAppPageNotifier extends StateNotifier<CustomAppPageState> {
  CustomAppPageNotifier()
      : super(const CustomAppPageState(toggle: [
          TogglePageState(),
          TogglePageState(position: Offset(200, 200)),
        ]));

  void changeToggleState({
    required int index,
    required TogglePageState toggle,
  }) {
    List<TogglePageState> tempList = state.toggle.asMap().entries.map((entry) {
      return entry.key == index ? toggle : entry.value;
    }).toList();
    state = state.copyWith(toggle: tempList);
  }

  void deleteToggleState({required int index}) {
    final List<TogglePageState> tempList = state.toggle
        .asMap()
        .entries
        .where((entry) => entry.key != index)
        .map((entry) => entry.value)
        .toList();
    state = state.copyWith(toggle: tempList);
  }

  void addToggle() {
    final List<TogglePageState> tempList = [
      ...state.toggle,
      const TogglePageState(),
    ];
    state = state.copyWith(toggle: tempList);
  }
}

class CustomAppViewModel {
  static final masterCustomAppProvider =
      StateNotifierProvider<CustomAppPageNotifier, CustomAppPageState>(
    (_) => CustomAppPageNotifier(),
  );
}
