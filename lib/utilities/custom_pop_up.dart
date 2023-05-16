//Packages
import 'package:tooggle/packages/packages_export.dart';

Future<void> editConfirmPopUp({
  required BuildContext rootContext,
  required String messageText,
  required Widget editPage,
}) async {
  return await showCupertinoModalPopup<void>(
    context: rootContext,
    builder: (BuildContext subContext) {
      return CupertinoActionSheet(
        message: Text(messageText),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(subContext).pop();
              Navigator.of(rootContext).push(
                MaterialPageRoute(
                  builder: (_) => editPage,
                ),
              );
            },
            child: const Text('編集する'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(subContext).pop();
          },
          child: const Text('キャンセル'),
        ),
      );
    },
  );
}
