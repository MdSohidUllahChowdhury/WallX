import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import 'package:wallx/controller/api/fetch.dart';
import 'package:wallx/view/set_wallpaper.dart';

class Wallx extends StatefulWidget {
  const Wallx({super.key});
  @override
  State<Wallx> createState() => _WallxState();
}

class _WallxState extends State<Wallx> {
  List apiImages = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    callingApi();
  }

  callingApi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=25'),
        headers: {'Authorization': apiKey}).then(
      (value) {
        Map<dynamic, dynamic> result = jsonDecode(value.body);
        //print(result);
        setState(() {
          apiImages = result['photos'];
        });
      },
    );
  }

  loadMoreFunction() async {
    setState(() {
      page = page + 1;
    });
    String url = 'https://api.pexels.com/v1/curated?per_page=25&page=$page';
    await http.get(Uri.parse(url), headers: {'Authorization': apiKey}).then(
      (value) {
        Map result = jsonDecode(value.body);
        setState(() {
          apiImages.addAll(result['photos']);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 45,
        elevation: 0,
        title: const Text(
          'WallX',
          style: TextStyle(
              letterSpacing: 1.3, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: GridView.builder(
          itemCount: apiImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 2 / 4,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Animate(
              child: Container(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: 
                      (context) => SetWallpaper(imagePath:apiImages[index]['src']['large2x'] ),));
                    },
                    child: Image.network(
                      apiImages[index]['src']['large'],
                      fit: BoxFit.cover,
                    ),
                  )),
            ).animate().fadeIn(duration: const Duration(seconds: 5)).shimmer(
                color: Colors.white, duration: const Duration(seconds: 3));
          },
        )),
        Center(
          child: InkWell(
            onTap: () => loadMoreFunction(),
            child: const CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 15,
              child: Icon(
                Icons.keyboard_double_arrow_down_outlined,
                color: Colors.black,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
