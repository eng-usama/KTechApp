import 'package:flutter/material.dart';
import 'package:k_tech/Controllers/Calendar/CalendarView.dart';
import 'package:k_tech/Controllers/HomeControllers/HomePage.dart';
import 'package:k_tech/NetworkingHttp/UserAuth.dart';
import 'package:provider/provider.dart';

import '../Wrapper.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    Wrapper(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamProvider<User>.value(
        value: AuthService().user,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.grey[200],
                selectedIconTheme: IconThemeData(color: Colors.cyan),
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                // this will be set when a new tab is tapped
                items: [
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.home),
                    title: new Text('Home'),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), title: Text('Profile'))
                ],
              ),
              appBar: AppBar(
                brightness: Brightness.dark,
                backgroundColor: Colors.cyan, //fromRGBO(51, 51, 51, 1),
                iconTheme: IconThemeData(
//      color: Colors.white, //change your color here
                    ),
                title: Text(
                  "K-tech",
                  style: TextStyle(color: Colors.white),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.calendar_today,color: Colors.white,),
                    tooltip: 'Academic Calendar',
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalendarView()));
                    },
                  ),
                ],
              ),
              body: _children[_currentIndex]),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
