import 'package:the_movie_db/features/home/data/models/movie_model.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_entity.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';

class MovieListModel extends MovieListEntity {
  final List<MovieEntity>? movieList;
  MovieListModel({this.movieList});

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    return MovieListModel(
        movieList: (json['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList());
  }
}
