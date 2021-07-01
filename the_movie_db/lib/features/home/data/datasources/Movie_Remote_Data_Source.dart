import 'package:dio/dio.dart';
import 'package:the_movie_db/core/error/failures.dart';
import 'package:the_movie_db/features/home/data/models/movie_list_model.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';

abstract class IMovieRemoteDataSource {
  ///Chama a lista de filmes do endpoint GET movie/popular.
  ///Chama [Server Exceptions] caso ocorra algum erro.
  Future<MovieListEntity> getMoviesList();
}

class MovieRemoteDataSource implements IMovieRemoteDataSource {
  final Dio dio;
  MovieRemoteDataSource({required this.dio});
  @override
  Future<MovieListEntity> getMoviesList() async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=8e1f3490365a847b0355d560842ce17e&language=en-US&page=1');
    return MovieListModel.fromJson(response.data);
  }
}
