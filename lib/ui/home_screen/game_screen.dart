import 'package:flutter/material.dart';
import 'live_tournaments.dart';
import 'package:gamezop_mock/ui/home_screen/featured_game_corousel.dart';

class GameScreen extends StatefulWidget {
  const GameScreen();

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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 48),
              child: Image.network('https://image4.owler.com/logo/gamezop1_owler_20190512_114038_original.png', width: MediaQuery.of(context).size.width/3,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: MediaQuery.of(context).orientation == Orientation.portrait? FeaturedGameCarousel(images: _gameImageLst): Container(),
            ),
            LiveTournaments(images: _gameImageLst),
          ],
        ),
      ),
    );
  }
}
