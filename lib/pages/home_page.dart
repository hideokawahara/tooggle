//Packages
import 'package:tooggle/packages/packages_export.dart';

//Pages
import 'package:tooggle/pages/pages_export.dart';

//Resources
import 'package:tooggle/resources/resources_export.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        title: const Text('ToogGle'),
      ),
      body: const HomePageBody(),
    );
  }
}

class HomePageBody extends ConsumerWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: const Text('test'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const TogglePage(),
              ),
            );
          },
        );
      },
    );
  }
}
