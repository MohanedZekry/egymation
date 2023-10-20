import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'anime_icon.dart';

class AnimeIconComponent extends StatelessWidget {
  const AnimeIconComponent({ required this.icon, this.color, this.size
    ,Key? key}) : super(key: key);

  final AnimeIcon icon;

  final Color? color;

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icons/${icon.name}.svg',
      color: color ?? IconTheme.of(context).color,
      width: size ?? IconTheme.of(context).size,
      height: size ?? IconTheme.of(context).size,
    );
  }
}
