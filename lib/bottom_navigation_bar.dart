import 'package:flutter/material.dart';
import 'package:gamezop_mock/bloc.dart';
import 'package:gamezop_mock/utils/Colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  int _index = 0;
  Color _selectedIndexColor = getColor(0xFF3e51b5);
  Color _backgroundColor = Colors.white;
  List<NavigationItem> _navigationItems = <NavigationItem> [
    NavigationItem(icon: Icon(Icons.home), text: Text('Home')),
    NavigationItem(icon: Icon(Icons.favorite_border), text: Text('Favourites')),
    NavigationItem(icon: Icon(Icons.search), text: Text('Search')),
    NavigationItem(icon: Icon(Icons.person_outline), text: Text('Profile')),
  ];

  Widget _buildNavigationItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: double.maxFinite,
      width: isSelected? 125: 50,
      decoration: isSelected? BoxDecoration(
        color: isSelected? _selectedIndexColor: _backgroundColor,
        borderRadius: BorderRadius.circular(50)
      ): null,
      padding: isSelected? EdgeInsets.only(left: 16, right: 16): null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                  data: IconThemeData(
                      color: isSelected? _backgroundColor: Colors.black,
                      size: 24),
                  child: item.icon),
              isSelected
                  ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: DefaultTextStyle.merge(
                    style: TextStyle(
                        color: isSelected? _backgroundColor: Colors.black
                    ),
                    child: item.text),
              )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 62,
      padding: EdgeInsets.all(8),
      color: _backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _navigationItems.map((it) {
          int selectedIndex = _navigationItems.indexOf(it);
          return GestureDetector(
            onTap: () {
              setState(() {
                _index = selectedIndex;
                // This will change the main screen
                // according to index.
                bloc.updateIndex(_index);
              });
            },
              child: _buildNavigationItem(it, _index == selectedIndex),
          );
        }).toList()
      ),
    );
  }

  _CustomBottomNavigationBarState() {
    bloc.updateIndex(_index);
  }
}


class NavigationItem {
  Icon icon;
  Text text;
  NavigationItem({this.icon, this.text});
}
