part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  final List<Widget> screenList = [
    const AnimeScreen(),
    const SearchScreen(),
    const AnimeScreen(),
    const SearchScreen(),
  ];

  NavigationState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}
