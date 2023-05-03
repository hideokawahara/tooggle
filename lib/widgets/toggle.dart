//Packages
import 'package:tooggle/packages/packages_export.dart';

//Models
import 'package:tooggle/models/models_export.dart';

//Utilities
import 'package:tooggle/utilities/utilities_export.dart';

//ViewModels
import 'package:tooggle/view_models/view_models_export.dart';

class ToggleSwitch extends StatelessWidget {
  final TogglePageState togglePageState;
  final TogglePageNotifier togglePageNotifier;
  const ToggleSwitch({
    Key? key,
    required this.togglePageState,
    required this.togglePageNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: togglePageState.toggleSize,
      width: togglePageState.toggleSize,
      child: FittedBox(
        fit: BoxFit.contain,
        child: CupertinoSwitch(
          activeColor: convertToToggleColorValue(
            togglePageState.selectColor,
          ),
          value: togglePageState.isOn,
          onChanged: (bool value) async {
            await tapFeedBackAction(
              togglePageState.selectFeedBack,
            );
            togglePageNotifier.changeIsOnStatus(value);
            if (value == false &&
                togglePageState.popUpStatus &&
                context.mounted) {
              bool result = await customPopUp(
                rootContext: context,
                messageText: togglePageState.popupText,
                isAble: togglePageState.popUpStatus,
              );
              if (result == false) {
                togglePageNotifier.changeIsOnStatus(
                  !value,
                );
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> tapFeedBackAction(TapFeedBack selectFeedback) async {
    switch (selectFeedback) {
      case TapFeedBack.weak:
        await HapticFeedback.selectionClick();
        break;
      case TapFeedBack.medium:
        await HapticFeedback.lightImpact();
        break;
      case TapFeedBack.strong:
        await HapticFeedback.heavyImpact();
        break;
      case TapFeedBack.vibe:
        await HapticFeedback.vibrate();
        break;
    }
  }

  Future<bool> customPopUp({
    required BuildContext rootContext,
    required bool isAble,
    required String messageText,
  }) async {
    if (isAble == false) {
      return false;
    }
    return await showCupertinoModalPopup<bool>(
            context: rootContext,
            builder: (BuildContext subContext) {
              return CupertinoActionSheet(
                message: Text(messageText),
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(subContext).pop(true);
                    },
                    child: const Text('オフにする'),
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.of(subContext).pop(false);
                  },
                  child: const Text('キャンセル'),
                ),
              );
            }) ??
        false;
  }
}
