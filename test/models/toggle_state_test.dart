import 'package:flutter_test/flutter_test.dart';
import 'package:tooggle/models/models_export.dart';

void main() {
  late TogglePageState toggle;
  setUp(() {
    toggle = const TogglePageState();
  });
  test('トグルモデルのデフォルトの確認テスト', () {
    expect(toggle.isOn, false);
    expect(toggle.selectFeedBack, TapFeedBack.weak);
    expect(toggle.selectColor, ToggleColor.green);
    expect(toggle.toggleSize, 200);
    expect(toggle.popUpStatus, false);
    expect(toggle.popupText, 'オフにしてもいいでしょうか？');
    expect(toggle.position, const Offset(0, 0));
  });
}
