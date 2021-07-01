import 'package:equatable/equatable.dart';

abstract class MovieListEvent extends Equatable {
  MovieListEvent();
}

class GetMovieList extends MovieListEvent {
  final String page;
  GetMovieList({required this.page});
  @override
  List<Object?> get props => [page];
}
