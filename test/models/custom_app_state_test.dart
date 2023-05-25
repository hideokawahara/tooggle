import 'package:flutter_test/flutter_test.dart';
import 'package:tooggle/models/models_export.dart';

void main() {
  late CustomAppPageState customApp;
  setUp(() {
    customApp = const CustomAppPageState();
  });
  test('カスタムアプリのデフォルトの確認テスト', () {
    expect(customApp.toggle.length, 2);
  });
}
