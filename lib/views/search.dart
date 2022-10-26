import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/cate.dart';
import '../models/Wallpaper_model.dart';
import '../widgets/brand.dart';

class Search extends StatefulWidget {
  final String searchquery;
  Search({required this.searchquery});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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

  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    getSearchedImages(widget.searchquery);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xfff5f8fd),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: "Search Wallpaper",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getSearchedImages(widget.searchquery);
                      },
                      child: Container(
                        child: Icon(Icons.search),
                      ),
                    )
                  ],
                ),
              ),
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
