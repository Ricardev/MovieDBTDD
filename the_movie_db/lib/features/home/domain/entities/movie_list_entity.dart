import 'package:equatable/equatable.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_entity.dart';

class MovieList extends Equatable {
  final List<MovieEntity>? movieList;
  MovieList({this.movieList});
  @override
  List<Object?> get props => [movieList];
}
