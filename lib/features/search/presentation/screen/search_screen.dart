import 'package:egymation/core/di/dependency_container.dart';
import 'package:egymation/core/style/colors.dart';
import 'package:egymation/core/style/display_size.dart';
import 'package:egymation/features/search/presentation/component/search_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../anime/presentation/controller/anime_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AnimeBloc>()..add(GetAllAnimeEvent()),
      child: BlocBuilder<AnimeBloc, AnimeState>(
        buildWhen: (previous, current) => previous.requestState != current.requestState,
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                height: DisplaySize(mContext: context).displayHeight() * .36,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        gradientColorOne,
                        gradientColorTwo
                      ],
                    )
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()
                ),
                child: Column(
                  children: [
                    const SizedBox(height: kToolbarHeight,),
                    const SearchComponent(),
                    MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                            parent: PageScrollPhysics()
                        ),
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) =>
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  16.0, 10.0, 16.0, 8.0),
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: searchItemBackgroundColor.withOpacity(.4),
                                borderRadius: BorderRadius.circular(27),

                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(17),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/ic_loading.gif',
                                        image: state.animeList[index].imagePath,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Show',
                                        style: GoogleFonts.exo2(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                      Text(
                                        state.animeList[index].title,
                                        style: GoogleFonts.exo2(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            )),
                        itemCount: state.animeList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
