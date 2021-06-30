import 'package:the_movie_db/core/error/exceptions.dart';
import 'package:the_movie_db/core/network/network_info.dart';
import 'package:the_movie_db/features/home/data/datasources/IMovie_Remote_Data_Source.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';
import 'package:the_movie_db/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:the_movie_db/features/home/domain/repositories/Imovie_repository.dart';

class MovieRepository implements IMovieRepository {
  final NetworkInfo networkInfo;
  final IMovieRemoteDataSource remoteDataSource;
  MovieRepository({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, MovieList>> getMoviesList() async {
    if (await networkInfo.isConnected) {
      try {
        final movieList = await remoteDataSource.getMoviesList();
        return Right(movieList);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
