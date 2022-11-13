import 'package:egymation/core/style/colors.dart';
import 'package:egymation/features/app/controller/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../anime/presentation/component/anime_icon.dart';
import '../../anime/presentation/component/anime_icon_component.dart';

class BottomNavigationComponent extends StatelessWidget {
  const BottomNavigationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14.0),
              topRight: Radius.circular(14.0),
            ),
            color: backgroundColor,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: IconThemeData(
              size: ((IconTheme
                  .of(context)
                  .size)! * 1.3),
            ),
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            onTap: (index){
              context.read<NavigationCubit>().getNavBarItem(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: AnimeIconComponent(icon: AnimeIcon.navSearch, size: 20),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: AnimeIconComponent(icon: AnimeIcon.navDownload),
                label: 'Soon',
              ),
              BottomNavigationBarItem(
                icon: AnimeIconComponent(icon: AnimeIcon.navAccount),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
