import 'package:flutter/material.dart';
import 'package:flutter_mastery/pages/navpages/bar_item_page.dart';
import 'package:flutter_mastery/pages/home_page.dart';
import 'package:flutter_mastery/pages/navpages/my_page.dart';
import 'package:flutter_mastery/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  // const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), title: Text('Bar')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('My')),
        ],
      ),
    );
  }
}
