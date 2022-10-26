import 'package:flutter/cupertino.dart';

class WallPaperModel {
  String photographerName;
  String photgrapherUrl;
  int photographerId;
  SrcModel src;
  factory WallPaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallPaperModel(
        photgrapherUrl: jsonData["photographer_url"],
        photographerId: jsonData["photographer_id"],
        photographerName: jsonData["photographer"],
        src: SrcModel.fromMap(jsonData["src"]));
  }
  WallPaperModel({
    required this.photgrapherUrl,
    required this.photographerId,
    required this.photographerName,
    required this.src,
  });
}

class SrcModel {
  String original;
  String portrait;
  String small;
  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        original: jsonData["original"],
        portrait: jsonData["portrait"],
        small: jsonData["small"]);
  }
  SrcModel(
      {required this.original, required this.portrait, required this.small});
}
