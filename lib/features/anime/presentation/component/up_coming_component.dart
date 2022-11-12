import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:egymation/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class UpComingComponent extends StatelessWidget {
  const UpComingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 169,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: 6,
          itemBuilder: (context, index) {
            return FadeIn(
              child: Container(
                margin: const EdgeInsets.only(right: 8.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(17)),
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
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: 190.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                          imageUrl: 'https://api-cdn.myanimelist.net/images/anime/1065/118763l.jpg',
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
                          borderRadius: BorderRadius.all(Radius.circular(17)),
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
                      'Demon Slayer',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 1,),
                    Expanded(
                      child: Text(
                        '2 Seasons - Episodes 10',
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
  }
}
