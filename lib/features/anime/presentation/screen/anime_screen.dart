import 'package:animate_do/animate_do.dart';
import 'package:egymation/core/di/dependency_container.dart';
import 'package:egymation/features/anime/presentation/controller/anime_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../component/header_componenet.dart';
import '../component/popular_component.dart';
import '../component/up_coming_component.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AnimeBloc>()..add(GetAllAnimeEvent()),
      child: SingleChildScrollView(
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
                      onTap: () {},
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
                      onTap: () {},
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
            const SizedBox(height: kBottomNavigationBarHeight + 15)
          ],
        ),
      ),
    );
  }
}
