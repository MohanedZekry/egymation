import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:egymation/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/enums_state.dart';
import '../controller/anime_bloc.dart';

class UpComingComponent extends StatelessWidget {
  const UpComingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeBloc, AnimeState>(
      buildWhen: (previous, current) => previous.requestState != current.requestState,

      builder: (context, state) {
        switch(state.requestState){
          case RequestState.loading:
            return const SizedBox(
              height: 169,
              child: Center(
                child: SpinKitFadingCircle(
                  size: 30,
                  color: primaryColor,
                ),
              ),
            );
          case RequestState.loaded:
            return SizedBox(
              height: 169,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.animeList.length,
                  itemBuilder: (context, index) {
                    return FadeInRight(
                      child: Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(17)),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(
                                  17)),
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(.9),
                                      Colors.transparent,
                                      Colors.black.withOpacity(.7),

                                    ],
                                    stops: const [0.0, 0.3, 1.0, 0.2],
                                  ).createShader(
                                    Rect.fromLTRB(
                                        0.0, 0.0, rect.width, rect.height),
                                  );
                                },
                                blendMode: BlendMode.dstIn,
                                child: CachedNetworkImage(
                                  width: 190.0,
                                  height: 130.0,
                                  fit: BoxFit.fill,
                                  imageUrl: state.animeList[index].imagePath,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey[850]!,
                                        highlightColor: Colors.grey[800]!,
                                        child: const SizedBox(
                                          height: 110.0,
                                          width: 120.0,
                                        ),
                                      ),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Container(
                              height: 3,
                              width: 180,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(17)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      secondaryColor,
                                      secondaryColor,
                                      Colors.grey,
                                    ],
                                  )
                              ),
                            ),
                            const SizedBox(height: 3,),
                            Text(
                              state.animeList[index].title,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 1,),
                            Expanded(
                              child: Text(
                                'Series',
                                style: GoogleFonts.firaSans(
                                    color: Colors.grey,
                                    letterSpacing: 0.14,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
