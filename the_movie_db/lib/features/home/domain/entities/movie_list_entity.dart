import 'package:equatable/equatable.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_entity.dart';

class MovieListEntity extends Equatable {
  final List<MovieEntity>? movieList;
  MovieListEntity({this.movieList});
  @override
  List<Object?> get props => [movieList];
}
