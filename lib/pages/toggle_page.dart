//Packages
import 'package:tooggle/packages/packages_export.dart';

//Resources
import 'package:tooggle/resources/resources_export.dart';

//Models
import 'package:tooggle/models/models_export.dart';

//ViewModels
import 'package:tooggle/view_models/view_models_export.dart';

class TogglePage extends StatelessWidget {
  const TogglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        title: const Text('ToogGle'),
      ),
      body: TogglePageBody(),
    );
  }
}

class TogglePageBody extends ConsumerWidget {
  TogglePageBody({Key? key}) : super(key: key);

  final controller = TextEditingController(text: 'オフにしてもいいでしょうか？');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TogglePageState togglePageState = ref.watch(togglePageProvider);
    final TogglePageNotifier togglePageNotifier =
        ref.watch(togglePageProvider.notifier);
    List<Widget> feedbackButtonList = _feedbackButtonList(
      isSelect: togglePageState.selectFeedBack,
      selectColor: togglePageState.selectColor,
      selectFeedBackCallBack: (TapFeedBack value) =>
          togglePageNotifier.changeFeedBack(
        value,
      ),
    );
    List<Widget> colorButtonList = _toggleColorList(
      selectColor: togglePageState.selectColor,
      selectColorCallBack: (ToggleColor value) =>
          togglePageNotifier.changeToggleColor(
        value,
      ),
    );

    return SafeArea(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 200,
                child: Center(
                  child: SizedBox(
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
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: feedbackButtonList,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: colorButtonList,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Slider(
                  value: togglePageState.toggleSize,
                  min: 100,
                  max: 300,
                  activeColor: convertToToggleColorValue(
                    togglePageState.selectColor,
                  ),
                  onChanged: (double value) {
                    togglePageNotifier.changeToggleSize(value);
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'ポップアップ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CupertinoSwitch(
                      value: togglePageState.popUpStatus,
                      activeColor: convertToToggleColorValue(
                        togglePageState.selectColor,
                      ),
                      onChanged: (bool value) async {
                        togglePageNotifier.changePopUpStatus(value);
                      },
                    ),
                  ],
                ),
              ),
              if (togglePageState.popUpStatus)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'メッセージ文',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: 'メッセージを入力使用',
                          hintStyle: const TextStyle(
                            fontSize: 12,
                          ),
                          fillColor: convertToToggleColorValue(
                            togglePageState.selectColor,
                          ).withOpacity(
                            0.3,
                          ),
                          filled: true,
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (String? value) {
                          if (value != null) {
                            togglePageNotifier.changePopUpText(value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
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

  List<Widget> _feedbackButtonList({
    required TapFeedBack isSelect,
    required ToggleColor selectColor,
    required void Function(TapFeedBack value) selectFeedBackCallBack,
  }) {
    return TapFeedBack.values.map((select) {
      final String buttonTitle;
      switch (select) {
        case TapFeedBack.weak:
          buttonTitle = '弱';
          break;
        case TapFeedBack.medium:
          buttonTitle = '中';
          break;
        case TapFeedBack.strong:
          buttonTitle = '強';
          break;
        case TapFeedBack.vibe:
          buttonTitle = '震';
          break;
      }
      return FloatingActionButton(
        heroTag: buttonTitle,
        backgroundColor: isSelect == select
            ? Colors.grey
            : convertToToggleColorValue(selectColor),
        child: Text(buttonTitle),
        onPressed: () {
          selectFeedBackCallBack(select);
        },
      );
    }).toList();
  }

  List<Widget> _toggleColorList({
    required ToggleColor selectColor,
    required void Function(ToggleColor value) selectColorCallBack,
  }) {
    return ToggleColor.values.map((color) {
      final String buttonTitle;
      switch (color) {
        case ToggleColor.green:
          buttonTitle = '緑';
          break;
        case ToggleColor.blue:
          buttonTitle = '青';
          break;
        case ToggleColor.red:
          buttonTitle = '赤';
          break;
        case ToggleColor.pink:
          buttonTitle = '桃';
          break;
      }
      return FloatingActionButton(
        heroTag: buttonTitle,
        backgroundColor: selectColor == color
            ? Colors.grey
            : convertToToggleColorValue(selectColor),
        child: Text(buttonTitle),
        onPressed: () {
          selectColorCallBack(color);
        },
      );
    }).toList();
  }

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
}
