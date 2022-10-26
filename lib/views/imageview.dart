import 'package:flutter/material.dart';

// import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String imgUrll;
  ImageView({required this.imgUrll});
  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Hero(
          tag: widget.imgUrll,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.imgUrll,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            // GestureDetector(
            // onTap: (() {
            //   Navigator.pop(context);
            // }),
            // child: Stack(children: [
            //   Container(
            //     height: 50,
            //     width: MediaQuery.of(context).size.width / 2,
            //     decoration: BoxDecoration(
            //       color: Color(0xff1C1B1B).withOpacity(0.8),
            //       borderRadius: BorderRadius.circular(40),
            //     ),
            //   ),
            // Container(
            //   height: 50,
            //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            //   width: MediaQuery.of(context).size.width / 2,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.white54, width: 1),
            //       borderRadius: BorderRadius.circular(30.0),
            //       gradient: const LinearGradient(colors: [
            //         Color(0x36FFFFFF),
            //         Color(0x0FFFFFFF),
            //       ])),
            // child: Column(
            // children: const [
            //   Text(
            //     "Set WallPaper",
            //     style: TextStyle(
            //       fontSize: 16,
            //       color: Colors.white70,
            //     ),
            //   ),
            //   Text(
            //     "Image will be saved in Gallery",
            //     style: TextStyle(
            //       fontSize: 10,
            //       color: Colors.white70,
            //     ),
            //   ),
            // ],
            // ),
            // ),
            //   ]),
            // ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ]),
        )
      ]),
    );
  }
}
