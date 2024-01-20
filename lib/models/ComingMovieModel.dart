class ComingMovieModel {
  final String backdrop_path;
  final String title;
  final int id;

  ComingMovieModel.fromJson(Map<String, dynamic> json)
      : backdrop_path = json['backdrop_path'],
        id = json['id'],
        title = json['title'];
}
