import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:egymation/core/style/colors.dart';
import 'package:egymation/core/style/display_size.dart';
import 'package:egymation/core/utils/enums_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controller/anime_bloc.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeBloc, AnimeState>(
      buildWhen: (previous, current) => (previous.requestState != current.requestState ||
          previous.index != current.index),
      builder: (context, state) {
        switch(state.requestState){
          case RequestState.loading:
            return SizedBox(
              height: DisplaySize(mContext: context).displayHeight() * .47,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: const SizedBox(
                  height: 150.0,
                  width: 120.0,
                ),
              ),
            );
          case RequestState.loaded:
            return SizedBox(
              height: DisplaySize(mContext: context).displayHeight() * .47,
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 500.0,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        context.read<AnimeBloc>().add(ChangeIndicatorEvent(index: index));
                      },
                    ),
                    items: state.animeList.map((item) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          GestureDetector(
                            key: const Key('openAnimeMinimalDetail'),
                            onTap: () {

                            },
                            child: ShaderMask(
                              shaderCallback: (rect) {
                                return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    // fromLTRB
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.85),
                                    Colors.black.withOpacity(0.85),
                                    Colors.transparent,
                                  ],
                                  stops: const [0, 0.1, 0.5, 1],
                                ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                                );
                              },
                              blendMode: BlendMode.dstIn,
                              child: CachedNetworkImage(
                                height: 500.0,
                                imageUrl: item.backgroundPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: dotContainerColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                        child: AnimatedSmoothIndicator(
                          activeIndex:  context.read<AnimeBloc>().state.index,
                          count: state.animeList.length,
                          effect: const WormEffect(
                            dotHeight: 5,
                            dotColor: Colors.grey,
                            spacing: 4.0,
                            dotWidth: 5,
                            paintStyle: PaintingStyle.stroke,
                            type: WormType.thin,
                            activeDotColor: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
