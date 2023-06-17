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
            onPressed: () async {
              // Navigator.of(subContext).pop();
              await Navigator.of(rootContext).push(
                MaterialPageRoute(
                  builder: (_) => editPage,
                ),
              );
              Navigator.of(subContext).pop();
              print("finish?");
            },
            child: const Text('編集する'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              //TODO: 削除ロジックを追加する
              Navigator.of(subContext).pop();
            },
            isDestructiveAction: true,
            child: const Text('削除する'),
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
