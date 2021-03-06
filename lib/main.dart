import 'package:flutter/material.dart';
import 'package:gamezop_mock/ui/favourites_screen/favourites_screen.dart';
import 'package:gamezop_mock/ui/bloc.dart';
import 'package:gamezop_mock/ui/common/bottom_navigation_bar.dart';
import 'package:gamezop_mock/ui/home_screen/game_screen.dart';
import 'package:gamezop_mock/ui/profile_screen/profile_screen.dart';
import 'package:gamezop_mock/utils/Colors.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final MaterialColor colorCustom = getColor(0xFF3e51b5);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: colorCustom,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: StreamBuilder<int>(
        stream: bloc.bottomNavigationIndexStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch(snapshot.data) {
              case 0: return const GameScreen();
              case 1: return const FavouritesScreen();
              case 3: return const ProfileScreen();
              default: return Center(child: Text('Not Available in this release'));
            }
          } else {
            return Center(
              child: Text('Loading...'),
            );
          }
        }
      ),
    );
  }
}
