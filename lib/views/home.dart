import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper/data/cate.dart';
import 'package:wallpaper/models/Wallpaper_model.dart';
import 'package:wallpaper/models/category_model.dart';
import 'package:wallpaper/views/category.dart';
import 'package:wallpaper/views/search.dart';
import 'package:wallpaper/widgets/brand.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<WallPaperModel> wallpapers = [];
  TextEditingController searchController = new TextEditingController();
  getTrendingImages() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=15&page=1"),
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
    getTrendingImages();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchquery: searchController.text,
                                    )));
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
              Container(
                height: 80.0,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: ((context, index) {
                    return CategoryTile(
                      imageUrl: categories[index].imgUrl,
                      text: categories[index].categoryName,
                    );
                  }),
                ),
              ),
              // const SizedBox(
              //   height: 16.0,
              // ),
              wallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, text;

  CategoryTile({required this.imageUrl, required this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return Category(categoryName: text);
        })));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 4.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              height: 50,
              width: 100,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
