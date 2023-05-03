//Packages
import 'package:tooggle/packages/packages_export.dart';

//Resources
import 'package:tooggle/resources/resources_export.dart';

//Models
import 'package:tooggle/models/models_export.dart';

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
      body: CustomAppPageBody(),
    );
  }
}

class CustomAppPageBody extends ConsumerWidget {
  const CustomAppPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TogglePageState togglePageState = ref.watch(togglePageProvider);
    final TogglePageNotifier togglePageNotifier =
        ref.watch(togglePageProvider.notifier);
    return CanvasWidget(
      widget: ToggleSwitch(
        togglePageState: togglePageState,
        togglePageNotifier: togglePageNotifier,
      ),
    );
  }
}

class CanvasWidget extends StatelessWidget {
  const CanvasWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPositionWidget(
          widget: widget,
        ),
        CustomPositionWidget(
          widget: widget,
          initialPosition: const Offset(100, 100),
        ),
      ],
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
