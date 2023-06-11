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
  group('トグルの色の確認テスト', () {
    test('トグルの色のデフォルトのテスト', () {
      expect(notifier.debugState.selectColor, ToggleColor.green);
      expect(getState().selectColor, ToggleColor.green);
    });
    test('トグルの色を青に変更テスト', () {
      expect(notifier.debugState.selectColor, ToggleColor.green);
      expect(getState().selectColor, ToggleColor.green);
      notifier.changeToggleColor(ToggleColor.blue);
      expect(notifier.debugState.selectColor, ToggleColor.blue);
      expect(getState().selectColor, ToggleColor.blue);
    });
    test('トグルの色を赤に変更', () {
      expect(notifier.debugState.selectColor, ToggleColor.green);
      expect(getState().selectColor, ToggleColor.green);
      notifier.changeToggleColor(ToggleColor.red);
      expect(notifier.debugState.selectColor, ToggleColor.red);
      expect(getState().selectColor, ToggleColor.red);
    });
    test('トグルの色をピンクに変更', () {
      expect(notifier.debugState.selectColor, ToggleColor.green);
      expect(getState().selectColor, ToggleColor.green);
      notifier.changeToggleColor(ToggleColor.pink);
      expect(notifier.debugState.selectColor, ToggleColor.pink);
      expect(getState().selectColor, ToggleColor.pink);
    });
  });
  group('トグルのサイズの確認テスト', () {
    test('トグルのサイズのデフォルトのテスト', () {
      expect(notifier.debugState.toggleSize, 200);
      expect(getState().toggleSize, 200);
    });
    test('トグルのサイズを100に変更', () {
      expect(notifier.debugState.toggleSize, 200);
      expect(getState().toggleSize, 200);
      notifier.changeToggleSize(100);
      expect(notifier.debugState.toggleSize, 100);
      expect(getState().toggleSize, 100);
    });
    test('トグルのサイズを300に変更', () {
      expect(notifier.debugState.toggleSize, 200);
      expect(getState().toggleSize, 200);
      notifier.changeToggleSize(300);
      expect(notifier.debugState.toggleSize, 300);
      expect(getState().toggleSize, 300);
    });
    test('トグルのサイズが100未満の場合、変更不可', () {
      expect(notifier.debugState.toggleSize, 200);
      expect(getState().toggleSize, 200);
      notifier.changeToggleSize(100);
      expect(notifier.debugState.toggleSize, 100);
      expect(getState().toggleSize, 100);
      notifier.changeToggleSize(99);
      expect(notifier.debugState.toggleSize, 100);
      expect(getState().toggleSize, 100);
    });
    test('トグルのサイズが300より上の場合、変更不可', () {
      expect(notifier.debugState.toggleSize, 200);
      expect(getState().toggleSize, 200);
      notifier.changeToggleSize(300);
      expect(notifier.debugState.toggleSize, 300);
      expect(getState().toggleSize, 300);
      notifier.changeToggleSize(301);
      expect(notifier.debugState.toggleSize, 300);
      expect(getState().toggleSize, 300);
    });
  });
  group('ポップアップステータスの確認テスト', () {
    test('ポップアップステータスのデフォルトのテスト', () {
      expect(notifier.debugState.popUpStatus, false);
      expect(getState().popUpStatus, false);
    });
    test('ポップアップステータスの変更のテスト', () {
      expect(notifier.debugState.popUpStatus, false);
      expect(getState().popUpStatus, false);
      notifier.changePopUpStatus(true);
      expect(notifier.debugState.popUpStatus, true);
      expect(getState().popUpStatus, true);
      notifier.changePopUpStatus(false);
      expect(notifier.debugState.popUpStatus, false);
      expect(getState().popUpStatus, false);
    });
  });
  group('ポップアップのテキストの確認テスト', () {
    test('ポップアップのテキストのデフォルトのテスト', () {
      expect(notifier.debugState.popupText, 'オフにしてもいいでしょうか？');
      expect(getState().popupText, 'オフにしてもいいでしょうか？');
    });
    test('ポップアップのテキスト変更のテスト', () {
      expect(notifier.debugState.popupText, 'オフにしてもいいでしょうか？');
      expect(getState().popupText, 'オフにしてもいいでしょうか？');
      const String testText = 'テキストの変更の確認テスト';
      notifier.changePopUpText(testText);
      expect(notifier.debugState.popupText, testText);
      expect(getState().popupText, testText);
    });
  });
  group('トグル変更の確認テスト', () {
    void checkDefaultToggle() {
      expect(notifier.debugState.isOn, false);
      expect(notifier.debugState.selectFeedBack, TapFeedBack.weak);
      expect(notifier.debugState.selectColor, ToggleColor.green);
      expect(notifier.debugState.toggleSize, 200);
      expect(notifier.debugState.popUpStatus, false);
      expect(notifier.debugState.popupText, 'オフにしてもいいでしょうか？');
      expect(notifier.debugState.position, const Offset(0, 0));
      expect(getState().isOn, false);
      expect(getState().selectFeedBack, TapFeedBack.weak);
      expect(getState().selectColor, ToggleColor.green);
      expect(getState().toggleSize, 200);
      expect(getState().popUpStatus, false);
      expect(getState().popupText, 'オフにしてもいいでしょうか？');
      expect(getState().position, const Offset(0, 0));
    }

    test('トグルのデフォルトの確認テスト', () {
      checkDefaultToggle();
    });
    test('ピンク色に変更したトグルとの変更のテスト', () {
      checkDefaultToggle();
      final TogglePageState tempToggle = notifier.debugState.copyWith(
        selectColor: ToggleColor.pink,
      );
      notifier.changeToggle(tempToggle);
      expect(notifier.debugState.selectColor, ToggleColor.pink);
      expect(getState().selectColor, ToggleColor.pink);
    });
  });

  group('トグルのマスター設定の確認テスト', () {
    test('マスター設定のデフォルトのテスト', () {
      expect(notifier.debugState.applyMasterSettings, true);
      expect(getState().applyMasterSettings, true);
    });

    test('マスター設定変更のテスト', () {
      expect(notifier.debugState.applyMasterSettings, true);
      expect(getState().applyMasterSettings, true);
      notifier.changeApplyMasterSettings(false);
      expect(notifier.debugState.applyMasterSettings, false);
      expect(getState().applyMasterSettings, false);
    });
  });
}
