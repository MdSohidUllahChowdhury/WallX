import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

// ignore: must_be_immutable
class SetWallpaper extends StatefulWidget {
  
  String? imagePath;
  SetWallpaper({super.key, 
  required this.imagePath});

  @override
  State<SetWallpaper> createState() => _SetWallpaperState();
}

Future<void> setWallpaper(String wallpaperUrl) async {
  int location = WallpaperManager.HOME_SCREEN;
  var file = await DefaultCacheManager().getSingleFile(wallpaperUrl);
  await WallpaperManager.setWallpaperFromFile(file.path, location);
}


class _SetWallpaperState extends State<SetWallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text(
          'Set as Wallpaper',
          style: TextStyle(
              letterSpacing: 1.3, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 20,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Image.network(widget.imagePath.toString())),
          Center(
            child: InkWell(
              onTap: () {
                setWallpaper(widget.imagePath.toString());
              },
              child: const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 25,
                child: Icon(
                  Icons.done,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}
