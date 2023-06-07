import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class BannerImage extends StatelessWidget {
  String path;

  BannerImage({required this.path});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.asset(
        "lib/assets/" + path,
        fit: BoxFit.cover,
      ),
    );
  }
}

class BannerSlide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BannerSlideState();
}

class BannerSlideState extends State<BannerSlide> {
  // List<BannerImage> _pathlist = [];

  // void append(String path) {
  //   setState(() {
  //     _pathlist.add(BannerImage(path: path));
  //   });
// }

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      isLoop: false,
      children: [
        BannerImage(path: "AD_Test1.jpg"),
        BannerImage(path: "AD_Test2.jpg"),
        BannerImage(path: "AD_Test3.jpg"),
      ],
    );
  }
}
