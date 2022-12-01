//Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class TogglePage extends StatelessWidget {
  const TogglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggler'),
      ),
      body: const TogglePageBody(),
    );
  }
}

class TogglePageBody extends StatefulWidget {
  const TogglePageBody({Key? key}) : super(key: key);

  @override
  State<TogglePageBody> createState() => _TogglePageBodyState();
}

class _TogglePageBodyState extends State<TogglePageBody> {
  bool isOn = false;
  TapFeedBack isSelect = TapFeedBack.weak;
  ToggleColor selectColor = ToggleColor.green;
  double toggleSize = 200;
  bool popUpStatus = false;
  var controller = TextEditingController(text: 'オフにしてもいいでしょうか？');

  @override
  Widget build(BuildContext context) {
    List<Widget> feedbackButtonList = _feedbackButtonList();
    List<Widget> colorButtonList = _toggleColorList();
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
                    height: toggleSize,
                    width: toggleSize,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: CupertinoSwitch(
                        activeColor: convertToToggleColorValue(selectColor),
                        value: isOn,
                        onChanged: (bool value) async {
                          await tapFeedBackAction(isSelect);
                          setState(() {
                            isOn = value;
                          });
                          if (value == false && popUpStatus) {
                            bool result = await customPopUp(
                              rootContext: context,
                              messageText: controller.value.text,
                              isAble: popUpStatus,
                            );
                            if (result == false) {
                              setState(() {
                                isOn = !isOn;
                              });
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
                  value: toggleSize,
                  min: 100,
                  max: 300,
                  onChanged: (double value) {
                    setState(() {
                      toggleSize = value;
                    });
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
                      value: popUpStatus,
                      activeColor: convertToToggleColorValue(selectColor),
                      onChanged: (bool value) async {
                        setState(() {
                          popUpStatus = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (popUpStatus)
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
                          fillColor: convertToToggleColorValue(selectColor)
                              .withOpacity(
                            0.3,
                          ),
                          filled: true,
                          isDense: true,
                          prefixIcon: const Icon(Icons.keyboard),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide.none,
                          ),
                        ),
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

  List<Widget> _feedbackButtonList() {
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
        backgroundColor: isSelect == select ? Colors.grey : null,
        child: Text(buttonTitle),
        onPressed: () {
          setState(() {
            isSelect = select;
          });
        },
      );
    }).toList();
  }

  List<Widget> _toggleColorList() {
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
        backgroundColor: selectColor == color ? Colors.grey : null,
        child: Text(buttonTitle),
        onPressed: () {
          setState(() {
            selectColor = color;
          });
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

enum TapFeedBack {
  weak,
  medium,
  strong,
  vibe,
}

enum ToggleColor {
  green,
  blue,
  red,
  pink,
}
