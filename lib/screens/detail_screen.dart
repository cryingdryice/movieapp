import 'package:flutter/material.dart';
import 'package:movieapp/models/MovieDetailModel.dart';
import 'package:movieapp/services/api_services.dart';
import 'package:movieapp/widgets/starRate_widget.dart';

class DetailScreen extends StatefulWidget {
  final String backdrop_path;
  final int id;

  const DetailScreen(
      {super.key, required this.backdrop_path, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;
  final String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('$baseImageUrl${widget.backdrop_path}'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white.withOpacity(0),
          elevation: 0,
          title: const Text("Back to list"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder(
            future: movie,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      //color: Colors.red,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.title,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                      child:
                          starRate(vote_average: snapshot.data!.vote_average),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${makeHourMinute(snapshot.data!.runtime)} | ${makeGenresString(snapshot.data!.genres)}",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    Container(
                      height: 30,
                      //color: Colors.green,
                    ),
                    const Text(
                      "Storyline",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 150,
                        //color: Colors.yellow,
                        child: SingleChildScrollView(
                          child: Text(
                            snapshot.data!.overview,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        )),
                    Container(
                      height: 20,
                      //color: Colors.cyan,
                    ),
                  ],
                );
              }
              return const Text("...");
            },
          ),
        ),
      ),
    );
  }

  String makeGenresString(List<dynamic> genreList) {
    return genreList.map((map) => map['name']).join(', ');
  }

  String makeHourMinute(int minutes) {
    if (minutes < 60) {
      return "${minutes}min";
    } else {
      int H = minutes ~/ 60;
      int M = minutes % 60;
      return "${H}h ${M}min";
    }
  }
}
