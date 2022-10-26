import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/cate.dart';
import '../models/Wallpaper_model.dart';
import '../widgets/brand.dart';

class Category extends StatefulWidget {
  String categoryName;
  Category({required this.categoryName});
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<WallPaperModel> wallpapers = [];
  getSearchedImages(String searchquery) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$searchquery&per_page=30&page=1"),
        headers: {
          "Authorization": apiKey,
        });
    // print(response.body.toString());
    Map<String, dynamic> jsondata = jsonDecode(response.body);
    jsondata["photos"].forEach((element) {
      // print(element);
      WallPaperModel wallpaper = WallPaperModel(
          photgrapherUrl: "",
          photographerId: -1,
          photographerName: "",
          src: SrcModel(original: "", portrait: "", small: ""));
      // WallPaperModel wallpaper = new WallPaperModel();
      wallpaper = WallPaperModel.fromMap(element);
      wallpapers.add(wallpaper);

      setState(() {});
    });
  }

  @override
  void initState() {
    getSearchedImages(widget.categoryName);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              wallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
