import 'package:flutter_test/flutter_test.dart';
import 'package:tooggle/packages/packages_export.dart';
import 'package:tooggle/view_models/view_models_export.dart';
import 'package:tooggle/models/models_export.dart';

void main() {
  late StateNotifierProvider<CustomAppPageNotifier, CustomAppPageState>
      provider;
  late CustomAppPageNotifier notifier;
  late CustomAppPageState Function() getState;
  setUpAll(() {
    provider = StateNotifierProvider<CustomAppPageNotifier, CustomAppPageState>(
      (_) => CustomAppPageNotifier(),
    );
    final container = ProviderContainer();
    notifier = container.read(provider.notifier);
    getState = () => container.read(provider);
  });

  group('アプリ作成の状態確認', () {
    test('デフォルト状態の確認', () {
      expect(notifier.debugState.toggle.length, 2);
      expect(notifier.debugState.toggle[1].position, const Offset(200, 200));
      expect(getState().toggle.length, 2);
      expect(getState().toggle[1].position, const Offset(200, 200));
    });
  });
}
