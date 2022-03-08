import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/navpages/accountPage.dart';
import 'package:travel_app/pages/navpages/homePage.dart';
import 'package:travel_app/pages/navpages/searchPage.dart';
import 'package:travel_app/pages/navpages/trendPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    TrendPage(),
    SearchPage(),
    AccountPage(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
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
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(title: Text("Home"), icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              title: Text("Trend"), icon: Icon(Icons.trending_up_outlined)),
          BottomNavigationBarItem(
              title: Text("Search"), icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              title: Text("Account"), icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
