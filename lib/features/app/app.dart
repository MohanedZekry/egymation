import 'package:egymation/features/anime/presentation/screen/anime_screen.dart';
import 'package:egymation/features/app/component/bottom_navigation_component.dart';
import 'package:egymation/features/app/controller/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          //leading: SvgPicture.asset('assets/icons/egymation_logo.svg', height: 50, width: 50,),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: const BottomNavigationComponent(),
        body: const AnimeScreen(),
      ),
    );
  }
}
