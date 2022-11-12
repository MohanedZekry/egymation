import 'package:animate_do/animate_do.dart';
import 'package:egymation/core/style/colors.dart';
import 'package:egymation/features/anime/presentation/component/anime_icon_component.dart';
import 'package:egymation/features/anime/presentation/component/header_componenet.dart';
import 'package:egymation/features/anime/presentation/component/popular_component.dart';
import 'package:egymation/features/anime/presentation/component/up_coming_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../component/anime_icon.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
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
            size: ((IconTheme.of(context).size)! * 1.3),
          ),
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
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
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Column(
          children: [
            FadeIn(
                duration: const Duration(seconds: 1),
                child: const HeaderComponent()
            ),
            FadeIn(
              duration: const Duration(seconds: 1),
              child: Container(
                margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('See all',
                              style: GoogleFonts.lato(
                                color: Colors.white,),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const UpComingComponent(),
            FadeIn(
              duration: const Duration(seconds: 1),
              child: Container(
                margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('See all',
                              style: GoogleFonts.lato(
                                color: Colors.white,),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const PopularComponent(),
            const SizedBox(height: kBottomNavigationBarHeight+10)
          ],
        ),
      ),
    );
  }
}
