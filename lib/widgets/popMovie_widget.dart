import 'package:flutter/material.dart';
import 'package:movieapp/screens/detail_screen.dart';

class PopMoive extends StatelessWidget {
  final String backdrop_path;
  final int id;

  final String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  const PopMoive({super.key, required this.backdrop_path, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
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
          //color: Colors.blue,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: 300,
          child: Transform.scale(
            scale: 1.3,
            child: Image.network('$baseImageUrl$backdrop_path'),
          ),
        ),
      ),
    );
  }
}
