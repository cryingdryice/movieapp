import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/models/ComingMovieModel.dart';
import 'package:movieapp/models/MovieDetailModel.dart';
import 'package:movieapp/models/NowingMovieModel.dart';
import 'package:movieapp/models/PopMovieModel.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static const String popular = "popular";
  Future<List<PopMovieModel>> getPopMovie() async {
    List<PopMovieModel> popMovieInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> popMovies =
          (jsonDecode(response.body)["results"] as List<dynamic>?)
                  ?.cast<Map<String, dynamic>>() ??
              [];
      for (var popMovie in popMovies) {
        popMovieInstances.add(PopMovieModel.fromJson(popMovie));
      }
      return popMovieInstances;
    }

    throw Error();
  }

  static const String now_playing = "now-playing";
  Future<List<NowingMovieModel>> getNowingMovie() async {
    List<NowingMovieModel> nowingMovieInstances = [];
    final url = Uri.parse('$baseUrl/$now_playing');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> nowingMovies =
          (jsonDecode(response.body)["results"] as List<dynamic>?)
                  ?.cast<Map<String, dynamic>>() ??
              [];
      for (var nowingMovie in nowingMovies) {
        nowingMovieInstances.add(NowingMovieModel.fromJson(nowingMovie));
      }
      return nowingMovieInstances;
    }

    throw Error();
  }

  static const String coming_soon = "coming-soon";
  Future<List<ComingMovieModel>> getComingMovie() async {
    List<ComingMovieModel> comingMovieInstances = [];
    final url = Uri.parse('$baseUrl/$coming_soon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> comingMovies =
          (jsonDecode(response.body)["results"] as List<dynamic>?)
                  ?.cast<Map<String, dynamic>>() ??
              [];
      for (var comingMovie in comingMovies) {
        comingMovieInstances.add(ComingMovieModel.fromJson(comingMovie));
      }
      return comingMovieInstances;
    }

    throw Error();
  }

  static Future<MovieDetailModel> getMovieById(String id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
