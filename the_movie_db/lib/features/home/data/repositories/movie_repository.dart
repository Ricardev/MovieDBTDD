import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';
import 'package:the_movie_db/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:the_movie_db/features/home/domain/repositories/Imovie_repository.dart';

class MovieRepository implements IMovieRepository {
  @override
  Future<Either<Failure, MovieList>> getMoviesList() {
    throw UnimplementedError();
  }
}
