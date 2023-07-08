//Packages
import 'package:tooggle/packages/packages_export.dart';

//Models
import 'package:tooggle/models/models_export.dart';

part 'custom_app_page_state.freezed.dart';

@freezed
class CustomAppPageState with _$CustomAppPageState {
  const factory CustomAppPageState({
    @Default([
      TogglePageState(),
      TogglePageState(),
    ])
    List<TogglePageState> toggle,
    required final List<Map<String, dynamic>> contents,
  }) = _CustomAppPageState;
}
