import 'package:flutter_test/flutter_test.dart';
import 'package:tooggle/packages/packages_export.dart';
import 'package:tooggle/view_models/view_models_export.dart';
import 'package:tooggle/models/models_export.dart';

void main() {
  late final StateNotifierProvider<TogglePageNotifier, TogglePageState>
      provider;
  late final TogglePageNotifier notifier;
  // late final TogglePageState state;
  setUp(() {
    provider = StateNotifierProvider<TogglePageNotifier, TogglePageState>(
      (_) => TogglePageNotifier(),
    );
    final container = ProviderContainer();
    notifier = container.read(provider.notifier);
    // state = container.read(provider);
  });
  group('トグルの状態確認のテスト', () {
    test('トグルのスイッチテスト', () {
      expect(notifier.debugState.isOn, false);
      // expect(state.isOn, false);
      notifier.changeIsOnStatus(true);
      expect(notifier.debugState.isOn, true);
      // expect(state.isOn, true);
    });
  });
}
