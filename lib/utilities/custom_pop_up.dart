//Packages
import 'package:tooggle/packages/packages_export.dart';

Future<EditResultType?> editConfirmPopUp({
  required BuildContext rootContext,
  required String messageText,
  required Widget editPage,
  required Function deleteCallBack,
}) async {
  return await showCupertinoModalPopup<EditResultType?>(
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
              print("finish?");
              return Navigator.of(subContext).pop(EditResultType.editSuccess);
            },
            child: const Text('編集する'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              deleteCallBack();
              return Navigator.of(subContext).pop(EditResultType.delete);
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

enum EditResultType {
  none,
  editSuccess,
  delete,
}
