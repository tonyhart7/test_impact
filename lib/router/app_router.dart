part of 'router.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MobileHomePage());
  }
}

class AppRouter extends StatelessWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetect().isMobile()) {
      return const MobileView();
    }

    return Container();
  }
}
