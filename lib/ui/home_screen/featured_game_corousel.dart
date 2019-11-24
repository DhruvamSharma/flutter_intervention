import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FeaturedGameCarousel extends StatefulWidget {
  final List<String> images;
  FeaturedGameCarousel({@required this.images});
  @override
  _FeaturedGameCarouselState createState() => _FeaturedGameCarouselState();
}

class _FeaturedGameCarouselState extends State<FeaturedGameCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          CarouselSlider(
            autoPlay: true,
            height: MediaQuery.of(context).size.height/5,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            viewportFraction: MediaQuery.of(context).orientation == Orientation.portrait? 0.9: 0.2,
            items: widget.images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(i), fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(8)
                      ),
                  );
                },
              );
            }).toList(),
          ),
        ]
    );
  }
}