//Packages
import 'package:tooggle/packages/packages_export.dart';

//Pages
import 'package:tooggle/pages/toggle_page.dart';

//Resources
import 'package:tooggle/resources/resources_export.dart';

//Models
import 'package:tooggle/models/models_export.dart';

//Utilities
import 'package:tooggle/utilities/utilities_export.dart';

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
    final CustomAppPageState customAppPageState =
        ref.watch(CustomAppViewModel.masterCustomAppProvider);
    final CustomAppPageNotifier customAppPageNotifier =
        ref.watch(CustomAppViewModel.masterCustomAppProvider.notifier);
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
      // マスターで設定されたものを初めに引き継いで、各トグルにproviderを作成する
      // 変更した状態を反映させたいときは、CustomAppViewModel.masterCustomAppProviderのnotifierを用いる
      //FIXME: 生成されるたびにマスターの状態を反映されて、設定がリセットされるため、条件を追加する
      var localValue = ref
          .watch(ToggleViewModel.masterToggleProvider)
          .copyWith(isOn: entry.value.isOn);
      if (!localValue.applyMasterSettings) {
        localValue = entry.value;
      }
      final toggleProvider =
          StateNotifierProvider<TogglePageNotifier, TogglePageState>(
        (_) => TogglePageNotifier(
          toggleState: localValue,
        ),
      );
      return CustomPositionWidget<TogglePageNotifier, TogglePageState>(
        initialPosition: entry.value.position,
        provider: toggleProvider,
        changeStateCallBack:
            (StateNotifierProvider<TogglePageNotifier, TogglePageState>
                toggle) {
          customAppNotifier.changeToggleState(
            index: entry.key,
            toggle: ref.watch(toggle).copyWith(
                  selectColor: ref.watch(toggle).selectColor,
                  position: entry.value.position,
                ),
          );
          ref
              .watch(ToggleViewModel.masterToggleProvider.notifier)
              .changeApplyMasterSettings(false);
        },
        changePositionCallBack: (Offset position) {
          customAppNotifier.changeToggleState(
            index: entry.key,
            toggle: localValue.copyWith(position: position),
          );
        },
        widget: ToggleSwitch(
          togglePageState: ref.watch(toggleProvider),
          toggleCallback: (bool value) {
            customAppNotifier.changeToggleState(
              index: entry.key,
              toggle: ref
                  .watch(
                    toggleProvider,
                  )
                  .copyWith(
                    position: entry.value.position,
                    isOn: value,
                  ),
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
class CustomPositionWidget<T extends StateNotifier<K>, K>
    extends StatelessWidget {
  const CustomPositionWidget({
    Key? key,
    required this.widget,
    required this.initialPosition,
    required this.changePositionCallBack,
    required this.provider,
    required this.changeStateCallBack,
  }) : super(key: key);
  final Widget widget;
  final Offset initialPosition;
  final void Function(Offset) changePositionCallBack;
  final StateNotifierProvider<T, K> provider;
  final void Function(StateNotifierProvider<T, K>) changeStateCallBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ドラッグのスタートをタップした直後に設定
      dragStartBehavior: DragStartBehavior.down,
      onLongPress: () async {
        await editConfirmPopUp(
          rootContext: context,
          messageText: 'トグルを編集しますか？',
          editPage: convertNextPage<T, K>(
            provider: provider,
          ),
        );
        // provider.read
        changeStateCallBack(provider);
      },
      onPanUpdate: (dragUpdateDetails) {
        var position = Offset(dragUpdateDetails.localPosition.dx - 100,
            dragUpdateDetails.localPosition.dy - 100);
        changePositionCallBack(position);
      },
      child: Stack(
        children: [
          Positioned(
            // 左上からどれだけ右にあるか
            left: initialPosition.dx,
            // 左上からどれだけ下にあるか
            top: initialPosition.dy,
            child: widget,
          ),
        ],
      ),
    );
  }
}

Widget convertNextPage<T extends StateNotifier<K>, K>({
  required StateNotifierProvider<T, K> provider,
}) {
  switch (provider.runtimeType) {
    case StateNotifierProvider<TogglePageNotifier, TogglePageState>:
      return TogglePage(
        rootProvider: provider
            as StateNotifierProvider<TogglePageNotifier, TogglePageState>,
      );
    default:
      return Container();
  }
}
