import 'package:bloc/bloc.dart';
import 'package:egymation/features/anime/presentation/screen/anime_screen.dart';
import 'package:egymation/features/search/presentation/screen/search_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../common/enum_navbar.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {

  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(int index) {
    switch (index) {
      case 0:
        emit(NavigationState(NavbarItem.home, 0));
        break;
      case 1:
        emit(NavigationState(NavbarItem.search, 1));
        break;
      case 2:
        emit(NavigationState(NavbarItem.download, 2));
        break;
      case 3:
        emit(NavigationState(NavbarItem.profile, 3));
        break;
    }
  }

}