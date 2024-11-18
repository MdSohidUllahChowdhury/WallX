import 'package:flutter/material.dart';
import 'package:wallx/view/collection.dart';
import 'package:wallx/view/favorite.dart';
import 'package:wallx/view/wallx.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  int navigationindex = 0;
  List<Widget> page =  [
    const Wallx(),
    const Collection(),
    const Favorite()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: navigationindex,
        children: page,
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex: navigationindex,
          onTap: (value) {
            setState(() {
              navigationindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.indeterminate_check_box_rounded), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          ]),
    );
  }
}
