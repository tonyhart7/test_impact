part of 'package:test_impact/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Open'),
              Tab(text: 'Complete'),
            ],
          ),
          title: const Text(
            'Activities',
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Container(
              height: 200,
              width: 500,
              color: Colors.lightGreen,
              child: const Text('Ongoing'),
            ),
            Container(
              height: 200,
              width: 500,
              color: Colors.redAccent,
              child: const Text('Complete'),
            ),
          ],
        ),
      ),
    );
  }
}
