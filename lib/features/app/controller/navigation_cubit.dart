import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../common/enum_navbar.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {

  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(int index) {
    switch (index) {
      case 0:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case 1:
        emit(const NavigationState(NavbarItem.search, 1));
        break;
      case 2:
        emit(const NavigationState(NavbarItem.download, 2));
        break;
      case 3:
        emit(const NavigationState(NavbarItem.profile, 3));
        break;
    }
  }

}