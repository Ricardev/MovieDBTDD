import 'package:equatable/equatable.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';

abstract class MovieListState extends Equatable {
  MovieListState();
}

class Empty extends MovieListState {
  @override
  List<Object?> get props => [];
}

class Loading extends MovieListState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loaded extends MovieListState {
  final MovieListEntity movieList;
  Loaded({required this.movieList});
  @override
  List<Object?> get props => [movieList];
}
