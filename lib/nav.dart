// By: Ariffin
import 'package:flutter/material.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override

  /* 2 Different ways to declare widget(old vs new) */
  // _NavState createState() => _NavState();
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    const Card1(),
    const Card2(),
    const Card3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cars Catalog',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.drive_eta_rounded), label: 'Sedan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.drive_eta_rounded), label: 'SUV'),
          BottomNavigationBarItem(
              icon: Icon(Icons.drive_eta_rounded), label: 'MPV'),
        ],
      ),
    );
  }
}
