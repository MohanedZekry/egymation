import 'package:egymation/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/style/display_size.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DisplaySize(mContext: context).displayHeight()*.47,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect){
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
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0)),
              child: Image.network(
                'https://api-cdn.myanimelist.net/images/anime/1286/99889l.jpg',

                width: DisplaySize(mContext: context).displayWidth(),
                fit: BoxFit.fill,

              ),
            ),
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
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: AnimatedSmoothIndicator(
                  activeIndex: 0,
                  count: 4,
                  effect: const WormEffect(
                    dotHeight: 5,
                    dotColor: Colors.grey,
                    spacing: 4.0,
                    dotWidth: 5,
                    paintStyle:  PaintingStyle.stroke,
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
  }
}
