part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  const BottomNavigationState._({
    this.page = BottomNav.home,
    this.index = 0,
  });

  const BottomNavigationState.home() : this._();

  const BottomNavigationState.activity()
      : this._(page: BottomNav.activity, index: 1);

  const BottomNavigationState.orders()
      : this._(page: BottomNav.orders, index: 2);

  const BottomNavigationState.profile()
      : this._(page: BottomNav.profile, index: 3);

  final BottomNav page;
  final int index;

  @override
  List<Object> get props => [page, index];
}
