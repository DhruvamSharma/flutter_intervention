import 'package:flutter/material.dart';
import 'live_tournaments.dart';
import 'package:gamezop_mock/ui/home_screen/featured_game_corousel.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  GlobalKey _globalKey = GlobalKey(debugLabel: "");

  List<String> _gameImageLst = <String>[
    'assets/game_1.png',
    'assets/game_2.png',
    'assets/game_3.png',
    'assets/game_4.png',
    'assets/game_5.png',
    'assets/game_6.png',
    'assets/game_7.png',
    'assets/game_9.png',
    'assets/game_10.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _globalKey,
      margin: EdgeInsets.only(top: 48),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MediaQuery.of(context).orientation == Orientation.portrait? FeaturedGameCarousel(images: _gameImageLst): Container(),
            LiveTournaments(images: _gameImageLst),
          ],
        ),
      ),
    );
  }
}
