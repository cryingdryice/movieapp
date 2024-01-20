class MovieDetailModel {
  final String title, overview, backdrop_path;
  final List<dynamic> genres;
  final int runtime;
  final double vote_average;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        genres = json['genres'],
        overview = json['overview'],
        backdrop_path = json['backdrop_path'],
        runtime = json['runtime'],
        vote_average = (json['vote_average']).toDouble();
}
