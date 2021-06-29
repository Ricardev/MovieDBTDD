import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie_db/core/error/failures.dart';
import 'package:the_movie_db/core/usecases/use_case.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_entity.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';
import 'package:the_movie_db/features/home/domain/repositories/Imovie_repository.dart';

class GetMovieList implements UseCase<MovieList, NoParams> {
  final IMovieRepository repository;
  GetMovieList(this.repository);

  @override
  Future<Either<Failure, MovieList>> call(NoParams noParams) async {
    return await repository.getMoviesList();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
