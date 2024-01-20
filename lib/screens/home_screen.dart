import 'package:flutter/material.dart';
import 'package:movieapp/models/ComingMovieModel.dart';
import 'package:movieapp/models/NowingMovieModel.dart';
import 'package:movieapp/models/PopMovieModel.dart';
import 'package:movieapp/services/api_services.dart';
import 'package:movieapp/widgets/comingMovie_widget.dart';
import 'package:movieapp/widgets/nowingMovie_widget.dart';
import 'package:movieapp/widgets/popMovie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopMovieModel>> popMovies = ApiService().getPopMovie();
  final Future<List<NowingMovieModel>> nowingMovies =
      ApiService().getNowingMovie();
  final Future<List<ComingMovieModel>> comingMovies =
      ApiService().getComingMovie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Popular Movies",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FutureBuilder(
                      future: popMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: makeList(snapshot, 1),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Now in Cinemas",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FutureBuilder(
                      future: nowingMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: makeList(snapshot, 2),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Coming Soon",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FutureBuilder(
                      future: comingMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: makeList(snapshot, 3),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<dynamic>> snapshot, int order) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        if (order == 1) {
          return PopMoive(
            backdrop_path: movie.backdrop_path,
            id: movie.id,
          );
        } else if (order == 2) {
          return NowingMovie(
            backdrop_path: movie.backdrop_path,
            title: movie.title,
            id: movie.id,
          );
        } else if (order == 3) {
          return ComingMovie(
            backdrop_path: movie.backdrop_path,
            title: movie.title,
            id: movie.id,
          );
        }

        return null;
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
