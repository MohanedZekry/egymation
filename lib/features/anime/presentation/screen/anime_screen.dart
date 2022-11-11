import 'package:egymation/core/style/display_size.dart';
import 'package:flutter/material.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Column(
          children: [
            SizedBox(
              height: DisplaySize(mContext: context).displayHeight()*.6,
              child: Stack(
                children: [
                  Image.network('https://cdn.pixabay.com/photo/2022/05/17/21/41/naruto-7203817_960_720.jpg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
