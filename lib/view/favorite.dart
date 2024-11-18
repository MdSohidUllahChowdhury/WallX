import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        title: const Text(
          'Favorites',
          style: TextStyle(
              letterSpacing: 1.3, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 20,
            color: Colors.white,
          ),
          Icon(
            Icons.more_vert_outlined,
            size: 20,
            color: Colors.white,
          )
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            Icons.heart_broken_outlined,
            color: Colors.white,
            size: 110,
          )),
          Center(child: Text('No Favorites yet')),
        ],
      ),
    );
  }
}
