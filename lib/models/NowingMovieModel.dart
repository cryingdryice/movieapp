class NowingMovieModel {
  final String backdrop_path;
  final String title;
  final int id;

  NowingMovieModel.fromJson(Map<String, dynamic> json)
      : backdrop_path = json['backdrop_path'],
        id = json['id'],
        title = json['title'];
}
