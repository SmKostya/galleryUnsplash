import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gallery_unsplash/photoWindow.dart';

class GalleryPage extends StatefulWidget {
  @override
  GalleryPageState createState() => GalleryPageState();
}

var openImage;

class GalleryPageState extends State<GalleryPage> {
  List<PhotoInGallery> apiImagesList = [];
  List<PhotoInGallery> imagesList = [
    PhotoInGallery(
        userName: "Mike Von",
        urlSmall:
            "https://images.unsplash.com/photo-1558980664-4d79c6e77b93?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjMyNDU2fQ",
        urlFull:
            "https://images.unsplash.com/photo-1558980664-4d79c6e77b93?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjMyNDU2fQ")
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gallery",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gallery"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(children: _imagesListView(context))),
      ),
    );
  }

  _imagesListView(context) {
    return imagesList
        .map((PhotoInGallery f) => InkWell(
              onTap: () {
                openImage = f;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OpenPhoto()),
                );
              },
              child: new Container(
                  constraints: new BoxConstraints.expand(
                    height: 200.0,
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
                  margin: new EdgeInsets.only(bottom: 5.0),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage(f.urlSmall),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: new Text(f.userName,
                      style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ))),
            ))
        .toList();
  }

  _loadImages() async {
    final response = await http.get(
        "https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0");
    if (response.statusCode == 200 && response.statusCode != null) {
      var allData = json.decode(response.body);
      allData.forEach((dynamic val) {
        var record = PhotoInGallery(
            userName: val["user"]["name"],
            urlSmall: val["urls"]["small"],
            urlFull: val["urls"]["full"]);
        apiImagesList.add(record);
      });
      setState(() {
        imagesList = apiImagesList;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImages();
  }
}

class PhotoInGallery {
  String userName;
  String urlSmall;
  String urlFull;

  PhotoInGallery({this.userName, this.urlSmall, this.urlFull});
}
