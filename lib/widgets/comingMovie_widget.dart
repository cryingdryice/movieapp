import 'package:flutter/material.dart';
import 'package:movieapp/screens/detail_screen.dart';

class ComingMovie extends StatelessWidget {
  final String backdrop_path;
  final String title;
  final int id;
  final String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  const ComingMovie(
      {super.key,
      required this.backdrop_path,
      required this.title,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(
                          backdrop_path: backdrop_path,
                          id: id,
                        ),
                    fullscreenDialog: false),
              );
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              height: 140,
              width: 130,
              child: Image.network('$baseImageUrl$backdrop_path',
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 50,
            width: 130,
            child: SingleChildScrollView(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
