import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/utils/enums_state.dart';
import '../controller/anime_bloc.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeBloc, AnimeState>(
      buildWhen: (previous, current) => previous.requestState != current.requestState,
      builder: (context, state) {
        switch(state.requestState){
          case RequestState.loading:
            return const SizedBox(
              height: 170,
              child: Center(
                child: SpinKitFadingCircle(
                  size: 30,
                  color: primaryColor,
                ),
              ),
            );
          case RequestState.loaded:
            return SizedBox(
              height: 170,
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
                                  width: 140.0,
                                  height: 165.0,
                                  fit: BoxFit.cover,
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
