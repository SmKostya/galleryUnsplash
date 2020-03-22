import 'package:flutter/material.dart';
import 'package:gallery_unsplash/gallery.dart';

class OpenPhoto extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Scheduler",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox.expand(
            child: new Container(
                alignment: Alignment.bottomLeft,
                padding: new EdgeInsets.only(left: 20.0, bottom: 16.0),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new NetworkImage(openImage.urlFull),
                    fit: BoxFit.cover,
                  ),
                ),
                child: new Text(openImage.userName,
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )))),
      )),
    );
  }
}
