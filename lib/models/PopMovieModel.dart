class PopMovieModel {
  final String backdrop_path;
  final int id;

  PopMovieModel.fromJson(Map<String, dynamic> json)
      : backdrop_path = json['backdrop_path'],
        id = json['id'];
}
