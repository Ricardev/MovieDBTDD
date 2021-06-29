import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';

abstract class IMovieRemoteDataSource {
  ///Chama a lista de filmes do endpoint GET movie/popular.
  ///Chama [Server Exceptions] caso ocorra algum erro.
  Future<MovieList> getMoviesList();
}
