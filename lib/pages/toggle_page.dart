//Packages
import 'package:tooggle/packages/packages_export.dart';

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

class TogglePage extends StatelessWidget {
  const TogglePage({
    Key? key,
    this.rootProvider,
  }) : super(key: key);
  final StateNotifierProvider<TogglePageNotifier, TogglePageState>?
      rootProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        title: const Text('ToogGle'),
      ),
      body: TogglePageBody(
        rootProvider: rootProvider,
      ),
    );
  }
}

class TogglePageBody extends ConsumerWidget {
  TogglePageBody({
    Key? key,
    required this.rootProvider,
  }) : super(key: key);
  final StateNotifierProvider<TogglePageNotifier, TogglePageState>?
      rootProvider;

  final controller = TextEditingController(text: 'オフにしてもいいでしょうか？');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateNotifierProvider<TogglePageNotifier, TogglePageState> toggleProvider =
        ToggleViewModel.masterToggleProvider;
    if (rootProvider != null) {
      toggleProvider = rootProvider!;
    }
    final TogglePageState togglePageState = ref.watch(toggleProvider);
    final TogglePageNotifier togglePageNotifier =
        ref.watch(toggleProvider.notifier);
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
                  child: ToggleSwitch(
                    togglePageState: togglePageState,
                    toggleCallback: (bool value) {
                      togglePageNotifier.changeIsOnStatus(value);
                    },
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
}
