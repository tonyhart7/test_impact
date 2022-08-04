part of 'package:test_impact/home/home.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationCubit>(
          create: (context) => BottomNavigationCubit(),
        ),
      ],
      child: const Scaffold(
        body: _HomeBody(),
        bottomNavigationBar: _HomeNav(),
        floatingActionButton: _HomeFab(),
      ),
    );
  }
}

class _HomeFab extends StatelessWidget {
  const _HomeFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      buildWhen: (previous, current) => previous.page != current.page,
      builder: (context, state) {
        return state.page == BottomNav.home
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddActivityPage()),
                  );
                },
                child: const Icon(Icons.add),
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      buildWhen: (previous, current) => previous.page != current.page,
      builder: (context, state) {
        switch (state.page) {
          case BottomNav.home:
            return const HomeScreen();
          case BottomNav.activity:
            return const ActivityScreen();
          case BottomNav.orders:
            return const OrdersScreen();
          case BottomNav.profile:
            return const ProfileScreen();
        }
      },
    );
  }
}

class _HomeNav extends StatelessWidget {
  const _HomeNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      buildWhen: (previous, current) => previous.page != current.page,
      builder: (context, state) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.schedule_rounded,
              ),
              label: 'My Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book_online_outlined,
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_sharp),
              label: 'My Profile',
            ),
          ],
          currentIndex: state.index,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            context.read<BottomNavigationCubit>().navigateTo(index);
          },
        );
      },
    );
  }
}
