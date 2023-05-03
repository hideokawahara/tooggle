//Packages
import 'package:tooggle/packages/packages_export.dart';

//Models
import 'package:tooggle/models/models_export.dart';

Color convertToToggleColorValue(ToggleColor color) {
  switch (color) {
    case ToggleColor.green:
      return Colors.green;
    case ToggleColor.blue:
      return Colors.blue;
    case ToggleColor.red:
      return Colors.red;
    case ToggleColor.pink:
      return Colors.pink;
  }
}
