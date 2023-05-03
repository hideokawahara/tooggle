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
      body: HomePageBody(),
    );
  }
}

class HomePageBody extends ConsumerWidget {
  HomePageBody({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> contents = [
    {'トグル': const TogglePage()},
    {
      'プレビュー': const CustomAppPage(),
    }
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: contents.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(contents[index].keys.first),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => contents[index].values.first,
              ),
            );
          },
        );
      },
    );
  }
}
