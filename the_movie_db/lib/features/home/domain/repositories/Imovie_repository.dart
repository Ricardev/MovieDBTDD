import 'package:dartz/dartz.dart';
import 'package:the_movie_db/core/error/failures.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';

abstract class IMovieRepository {
  Future<Either<Failure, MovieListEntity>> getMoviesList();
}
