import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_state.dart';

enum BottomNav { home, activity, orders, profile }

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState.home());

  void navigateTo(int index) {
    switch (index) {
      case 0:
        emit(const BottomNavigationState.home());
        break;
      case 1:
        emit(const BottomNavigationState.activity());
        break;
      case 2:
        emit(const BottomNavigationState.orders());
        break;
      case 3:
        emit(const BottomNavigationState.profile());
        break;
    }
  }
}
