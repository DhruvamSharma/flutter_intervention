import 'package:flutter/material.dart';
import 'package:gamezop_mock/ui/game_detail_screen/game_detail_screen.dart';

class LiveTournaments extends StatefulWidget {
  final List<String> images;
  LiveTournaments({@required this.images});
  @override
  _LiveTournamentsState createState() => _LiveTournamentsState();
}

class _LiveTournamentsState extends State<LiveTournaments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 32, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DefaultTextStyle.merge(
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 32,
              ),
              child: Text('Live Tournaments'),
            ),

            DefaultTextStyle.merge(
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 16,
                color: Colors.grey
              ),
              child: Text('Keep winning money'),
            ),

            GridView.builder(
              shrinkWrap: true,
              itemCount: widget.images.length,
              padding: EdgeInsets.only(top: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait? 2: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 0,),
              itemBuilder: (context, position) {
                  return buildTournamentCard(position);
                },
            )
          ],
        ),
      ),
    );
  }

  Widget buildTournamentCard(int position) {
    return GestureDetector(
      onTap: () {onGameTap('${widget.images[position]} $position', widget.images[position]);},
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Hero(
          tag: '${widget.images[position]} $position',
          child: Image.asset(widget.images[position], fit: BoxFit.cover,),)
      ),
    );
  }

  void onGameTap(String heroTag, String cover) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return GameDetailScreen(heroTag: heroTag, image: cover);
    }));
  }
}
