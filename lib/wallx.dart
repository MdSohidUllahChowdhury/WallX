import 'package:flutter/material.dart';

class Wallx extends StatefulWidget {
  const Wallx({super.key});

  @override
  State<Wallx> createState() => _WallxState();
}

class _WallxState extends State<Wallx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: GridView.builder(
            itemCount: 60,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 2),
            itemBuilder: (context, index) {
              return Container(
                color: const Color.fromARGB(255, 110, 88, 23),
              );
            },
          )),
          Container(
            height:30,
            color: Colors.black,
            child:const Center(child: Text('Load more...'),),
          )
        ],
      ),
    );
  }
}
