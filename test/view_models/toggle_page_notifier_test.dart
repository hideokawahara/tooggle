import 'package:flutter_test/flutter_test.dart';
import 'package:tooggle/packages/packages_export.dart';
import 'package:tooggle/view_models/view_models_export.dart';
import 'package:tooggle/models/models_export.dart';

void main() {
  // setUp(() => null)
  group('トグルの状態確認のテスト', () {
    test('トグルのスイッチテスト', () {
      final provider =
          StateNotifierProvider<TogglePageNotifier, TogglePageState>(
        (_) => TogglePageNotifier(),
      );
      final container = ProviderContainer();
      final notifier = container.read(provider.notifier);
      expect(notifier.debugState.isOn, false);
      notifier.changeIsOnStatus(true);
      expect(notifier.debugState.isOn, true);
    });
  });
}
