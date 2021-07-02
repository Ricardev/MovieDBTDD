import 'package:the_movie_db/features/home/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final String? poster_path;
  final String? overview;
  final String? release_date;
  final int id;
  final String? original_title;
  final double? vote_average;
  MovieModel(
      {required this.id,
      this.original_title,
      this.overview,
      this.poster_path,
      this.release_date,
      this.vote_average})
      : super(id: id);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        poster_path: json['poster_path'],
        overview: json['overview'],
        original_title: json['original_title'],
        release_date: json['release_date'],
        vote_average: json['vote_average'].toDouble());
  }
}
