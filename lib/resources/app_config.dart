//Packages
import 'package:tooggle/packages/packages_export.dart';

//Models
import 'package:tooggle/models/models_export.dart';

class AppConfigs {
  static const double defaultDefaultSize = 200;
  static const Offset defaultPosition = Offset(0, 0);
  static const List<Map<String, dynamic>> contents = [
    {
      'content_key': 'toggle',
      'content_text': 'トグル',
      'content_value': TogglePageState(),
    },
    {
      'content_key': 'pull',
      'content_text': 'プル',
      //TODO: 適切な値に差し替える
      'content_value': TogglePageState(),
    },
  ];
}
