import 'package:flutter/material.dart';
import 'package:gallery_unsplash/gallery.dart';


void main() => runApp(Scheduler());

class Scheduler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: "Unsplash Gallery",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryPage(),
    );
  }
  
}

