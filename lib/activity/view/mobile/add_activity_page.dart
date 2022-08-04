part of 'package:test_impact/activity/activity.dart';

class AddActivityPage extends StatelessWidget {
  const AddActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        centerTitle: true,
        title: Text(
          'New Activity',
          style: AppStyle.textSubTitleWhite,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SizedBox(
              width: 0.8.sw,
              child: ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: () {},
                clipBehavior: Clip.antiAlias,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: const StadiumBorder(),
                  primary: Colors.cyan,
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: AppStyle.textSubTitleWhite,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 0.02.sh),
        ],
      ),
    );
  }
}
