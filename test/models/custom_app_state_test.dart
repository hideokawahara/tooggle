import 'package:flutter_test/flutter_test.dart';
import 'package:tooggle/models/models_export.dart';
import 'package:tooggle/resources/app_config.dart';

void main() {
  late CustomAppPageState customApp;
  setUp(() {
    customApp = const CustomAppPageState(
      contents: AppConfigs.contents,
    );
  });
  test('カスタムアプリのデフォルトの確認テスト', () {
    expect(customApp.toggle.length, 2);
  });
}
