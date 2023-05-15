//Packages
import 'package:tooggle/packages/packages_export.dart';

//Pages
import 'package:tooggle/pages/toggle_page.dart';

//Resources
import 'package:tooggle/resources/resources_export.dart';

//Models
import 'package:tooggle/models/models_export.dart';
import 'package:tooggle/view_models/custom_app_page_notifier.dart';

//ViewModels
import 'package:tooggle/view_models/view_models_export.dart';

//Widgets
import 'package:tooggle/widgets/widgets_export.dart';

class CustomAppPage extends StatelessWidget {
  const CustomAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        title: const Text('ToogGle'),
      ),
      body: const CustomAppPageBody(),
    );
  }
}

class CustomAppPageBody extends ConsumerWidget {
  const CustomAppPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CustomAppPageState customAppPageState = ref.watch(customAppProvider);
    final CustomAppPageNotifier customAppPageNotifier =
        ref.watch(customAppProvider.notifier);
    return CanvasWidget(
      toggle: customAppPageState.toggle,
      customAppNotifier: customAppPageNotifier,
    );
  }
}

class CanvasWidget extends ConsumerWidget {
  const CanvasWidget({
    Key? key,
    required this.toggle,
    required this.customAppNotifier,
  }) : super(key: key);
  final List<TogglePageState> toggle;
  final CustomAppPageNotifier customAppNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> canvasList = toggle.asMap().entries.map((entry) {
      var localValue =
          ref.watch(masterToggleProvider).copyWith(isOn: entry.value.isOn);
      final toggleProvider =
          StateNotifierProvider<TogglePageNotifier, TogglePageState>(
        (_) => TogglePageNotifier(
          toggleState: localValue,
        ),
      );
      return CustomPositionWidget(
        initialPosition: entry.value.position,
        widget: ToggleSwitch(
          togglePageState: ref.watch(toggleProvider),
          toggleCallback: (bool value) {
            ref.watch(toggleProvider.notifier).changeIsOnStatus(value);
            customAppNotifier.changeToggleState(
              index: entry.key,
              toggle: ref.watch(toggleProvider),
            );
          },
        ),
      );
    }).toList();
    return Stack(
      children: canvasList,
    );
  }
}

//Todo: ConsumerWidgetに差し替える
class CustomPositionWidget extends StatefulWidget {
  const CustomPositionWidget({
    Key? key,
    required this.widget,
    this.initialPosition,
  }) : super(key: key);
  final Widget widget;
  final Offset? initialPosition;

  @override
  State<CustomPositionWidget> createState() => _CustomPositionWidgetState();
}

class _CustomPositionWidgetState extends State<CustomPositionWidget> {
  var position = const Offset(0, 0);
  @override
  void initState() {
    super.initState();
    if (widget.initialPosition != null) {
      position = widget.initialPosition!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ドラッグのスタートをタップした直後に設定
      dragStartBehavior: DragStartBehavior.down,
      onLongPress: () async {
        await editConfirmPopUp(
          rootContext: context,
          messageText: 'トグルを編集しますか？',
        );
      },
      onPanUpdate: (dragUpdateDetails) {
        // position = dragUpdateDetails.localPosition;
        position = Offset(dragUpdateDetails.localPosition.dx - 100,
            dragUpdateDetails.localPosition.dy - 100);
        setState(() {});
      },
      child: Stack(
        children: [
          Positioned(
            // 左上からどれだけ右にあるか
            left: position.dx,
            // 左上からどれだけ下にあるか
            top: position.dy,
            child: widget.widget,
          ),
          // Container(
          //   color: Colors.transparent,
          // ),
        ],
      ),
    );
  }
}

Future<void> editConfirmPopUp({
  required BuildContext rootContext,
  required String messageText,
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
                    builder: (_) => const TogglePage(),
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
      });
}
