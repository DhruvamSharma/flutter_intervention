import 'package:flutter/material.dart';
import 'package:gamezop_mock/ui/common/divider.dart';
import 'package:gamezop_mock/utils/Colors.dart';

import '../bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 48),
              child: GestureDetector(
                  onTap: () {
                    bloc.updateIndex(0);
                  },
                  child: Image.network(
                    'https://image4.owler.com/logo/gamezop1_owler_20190512_114038_original.png',
                    width: MediaQuery.of(context).size.width / 3,
                  )),
            ),
            // Header

            _buildHeader(),

            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[

          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  selected: false,
//                  leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/599px-Instagram_icon.png', width: 48, fit: BoxFit.cover,),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text('Gamezop Bazaar'),
                ),
                CustomHorizontalDivider(width: MediaQuery.of(context).size.width, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    selected: false,
//                    leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/599px-Instagram_icon.png', width: 48, fit: BoxFit.cover,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Spin the wheel'),
                  ),
                ),
              ],
            ),
          ),

          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  selected: false,
                  leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/599px-Instagram_icon.png', width: 48, fit: BoxFit.cover,),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text('Follow us on Instagram'),
                ),
                CustomHorizontalDivider(width: MediaQuery.of(context).size.width, color: Colors.grey),
                ListTile(
                  selected: false,
                  leading: Image.network('http://www.vectorico.com/download/social_media/Whatsapp-Icon.png', width: 48, fit: BoxFit.cover,),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text('Refer and Earn'),
                ),
                CustomHorizontalDivider(width: MediaQuery.of(context).size.width, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    selected: false,
                    leading: Image.network('https://img.icons8.com/officel/2x/facebook-new.png'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Facebook'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 70,
              backgroundColor: primaryColor,
              backgroundImage: NetworkImage(
                  'https://miro.medium.com/max/3150/1*AHHbsYvOb7iI_1WI4xE91g.png'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultTextStyle.merge(
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            child: Text('Dhruvam'),
          ),
        ),

        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          child: SelectableText('+91 7988504379'),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Winnings'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('₹323'),
                  )
                ],
              ),

              CustomVerticalDivider(height: MediaQuery.of(context).size.height / 14, color: Colors.grey),

              Column(
                children: <Widget>[
                  Text('Deposits'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('₹323'),
                  )
                ],
              ),

              CustomVerticalDivider(height: MediaQuery.of(context).size.height / 14, color: Colors.grey),

              Column(
                children: <Widget>[
                  Text('Promo'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('₹323'),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
