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
            SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    dumbActivity.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0.08.sh,
                            width: 1.sw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      DateFormat('dd MMM yyyy').format(
                                        dumbActivity[index].when,
                                      ),
                                      style: AppStyle.textBodyBOLD,
                                    ),
                                    Text(
                                      '09.00',
                                      style: AppStyle.textBodyBOLD,
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.blue[500],
                                  ),
                                  height: 0.06.sh,
                                  width: 0.66.sw,
                                  child: Text(
                                    'Meeting with ${dumbActivity[index].institution}',
                                    style: AppStyle.textBodyWhite,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
