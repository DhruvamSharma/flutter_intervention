import 'package:flutter/material.dart';
import 'package:gamezop_mock/ui/game_detail_screen/game_detail_screen.dart';
import 'package:gamezop_mock/utils/Colors.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {

  GlobalKey<AnimatedListState> _listState = GlobalKey();

  List<Game> _gameImageLst = <Game>[
    Game(assetPath: 'assets/game_1.png', assetName: 'Sticky Goo',isLiked: true, totalMoneyWon: 321),
    Game(assetPath: 'assets/game_2.png', assetName: 'Rope Ninja',isLiked: true, totalMoneyWon: 10),
    Game(assetPath: 'assets/game_3.png', assetName: 'Bubble Wipe Out',isLiked: true, totalMoneyWon: 553),
    Game(assetPath: 'assets/game_4.png', assetName: 'Knight Ride',isLiked: true, totalMoneyWon: 543),
    Game(assetPath: 'assets/game_5.png', assetName: 'Spinning Shooter',isLiked: true, totalMoneyWon: 26),
    Game(assetPath: 'assets/game_6.png', assetName: 'Bottle Shoot',isLiked: true, totalMoneyWon: 3),
    Game(assetPath: 'assets/game_7.png', assetName: 'Aqua Theif',isLiked: true, totalMoneyWon: 654),
    Game(assetPath: 'assets/game_9.png', assetName: 'Colour Chase',isLiked: true, totalMoneyWon: 12),
    Game(assetPath: 'assets/game_10.png', assetName: 'Jelly Slice',isLiked: true, totalMoneyWon: 765),
  ];

  Widget _buildGameCard(Game game, bool isLiked) {
    return GestureDetector(
      onTap: () {
        onGameTap(game.assetName, game.assetPath);
      },
      child: Card(
        child: ListTile(
          title: Text(game.assetPath),
          leading: Hero(
            tag: game.assetName,
            child: Image.asset(
              game.assetPath,
            ),
          ),
          subtitle: Text('Total Money won: ₹${game.totalMoneyWon}'),
          trailing: GestureDetector(
            onTap: () {
              // Change the like's bool
              setState(() {
                game.isLiked = !isLiked;
                _gameImageLst.removeAt(_gameImageLst.indexOf(game));
              });
            },
            child: IconTheme(
              data: IconThemeData(color: primaryColor),
              child: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 48),
            child: Image.network('https://image4.owler.com/logo/gamezop1_owler_20190512_114038_original.png', width: MediaQuery.of(context).size.width/3,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultTextStyle.merge(
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              child: Text('Your favourite games are here'),
            ),
          ),
          ListView.builder(
            key: _listState,
            itemCount: _gameImageLst.length,
            itemBuilder: (context, index) {
              return _buildGameCard(_gameImageLst[index], _gameImageLst[index].isLiked);
            },
            padding: EdgeInsets.only(top: 8),
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }

  void onGameTap(String heroTag, String cover) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return GameDetailScreen(heroTag: heroTag, image: cover);
    }));
  }

}

class Game {
  String assetPath;
  String assetName;
  bool isLiked;
  int totalMoneyWon;
  Game({this.assetPath, this.assetName, this.isLiked, this.totalMoneyWon});
}
