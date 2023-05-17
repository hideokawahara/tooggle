import 'package:flutter_test/flutter_test.dart';
import 'package:tooggle/packages/packages_export.dart';
import 'package:tooggle/view_models/view_models_export.dart';
import 'package:tooggle/models/models_export.dart';

void main() {
  late StateNotifierProvider<TogglePageNotifier, TogglePageState> provider;
  late TogglePageNotifier notifier;
  late TogglePageState Function() getState;
  setUp(() {
    provider = StateNotifierProvider<TogglePageNotifier, TogglePageState>(
      (_) => TogglePageNotifier(),
    );
    final container = ProviderContainer();
    notifier = container.read(provider.notifier);
    getState = () => container.read(provider);
  });
  group('トグルの状態確認のテスト', () {
    test('トグルのスイッチテスト', () {
      expect(notifier.debugState.isOn, false);
      expect(getState().isOn, false);
      notifier.changeIsOnStatus(true);
      expect(notifier.debugState.isOn, true);
      expect(getState().isOn, true);
    });
  });
  group('トグルの振動の確認のテスト', () {
    test('振動のデフォルトのテスト', () {
      expect(notifier.debugState.selectFeedBack, TapFeedBack.weak);
      expect(getState().selectFeedBack, TapFeedBack.weak);
      notifier.changeFeedBack(TapFeedBack.medium);
    });
    test('振動を中に変更テスト', () {
      expect(notifier.debugState.selectFeedBack, TapFeedBack.weak);
      expect(getState().selectFeedBack, TapFeedBack.weak);
      notifier.changeFeedBack(TapFeedBack.medium);
      expect(notifier.debugState.selectFeedBack, TapFeedBack.medium);
      expect(getState().selectFeedBack, TapFeedBack.medium);
    });
    test('振動を強に変更テスト', () {
      expect(notifier.debugState.selectFeedBack, TapFeedBack.weak);
      expect(getState().selectFeedBack, TapFeedBack.weak);
      notifier.changeFeedBack(TapFeedBack.strong);
      expect(notifier.debugState.selectFeedBack, TapFeedBack.strong);
      expect(getState().selectFeedBack, TapFeedBack.strong);
    });
    test('振動をバイブに変更テスト', () {
      expect(notifier.debugState.selectFeedBack, TapFeedBack.weak);
      expect(getState().selectFeedBack, TapFeedBack.weak);
      notifier.changeFeedBack(TapFeedBack.vibe);
      expect(notifier.debugState.selectFeedBack, TapFeedBack.vibe);
      expect(getState().selectFeedBack, TapFeedBack.vibe);
    });
  });
}
