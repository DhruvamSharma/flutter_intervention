import 'package:flutter/material.dart';
import 'package:gamezop_mock/utils/Colors.dart';

class GameDetailScreen extends StatefulWidget {
  final String heroTag;
  final String image;
  GameDetailScreen({@required this.heroTag, @required this.image});
  @override
  _GameDetailScreenState createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  bool _isLiked;
  double _currentRating;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLiked = false;
    _currentRating = 34;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Hero(
                          tag: widget.heroTag,
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3,
                          ),
                        ),
                        Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 64,
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          child: Card(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Game Details",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "Ratings can come here",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    AppBar(
                      automaticallyImplyLeading: true,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),

                  ],
                ),


                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            DefaultTextStyle.merge(
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              child: Text(
                                'Sticky Goo',
                              ),
                            ),
                            IconButton(
                                icon: Icon(_isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                                color: _isLiked ? primaryColor : null,
                                onPressed: () {
                                  print('here');
                                  setState(() {
                                    print("clicked");
                                    _isLiked = !_isLiked;
                                  });
                                }),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Header of the card
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'PLAYERS',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.person_outline),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${_currentRating.round()}/200',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 0.2,
                                    height: MediaQuery.of(context).size.height / 14,
                                    decoration: BoxDecoration(color: Colors.grey),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'PLAYERS',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.person_outline),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '22/200',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Slider.adaptive(
                              value: _currentRating,
                              onChanged: (newRating) {
                                setState(() => _currentRating = newRating);
                              },
                              label: '${_currentRating.round()}',
                              min: 0,
                              activeColor: Colors.amber,
                              max: 200,
                            ),

                            Container(
                              height: 0.2,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.grey),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 32.0, right: 32.0, top: 8.0, bottom: 16),
                              child: Text(
                                'Prize breakup for ${_currentRating.round()} Players',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 32.0, right: 32.0, top: 8.0, bottom: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Ranks 1-8',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '12',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 32.0, right: 32.0, top: 8.0, bottom: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Ranks 9-21',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '12',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 32.0, right: 32.0, top: 8.0, bottom: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Ranks 22-54',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '12',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                color: primaryColor,
                onPressed: () {},
                child: Text(
                  'Play for 5',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
