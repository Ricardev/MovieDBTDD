import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie_db/core/network/network_info.dart';
import 'package:the_movie_db/core/states/application_states.dart';
import 'package:the_movie_db/features/home/data/datasources/Movie_Remote_Data_Source.dart';
import 'package:the_movie_db/features/home/data/repositories/movie_repository.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';
import 'package:the_movie_db/features/home/domain/repositories/Imovie_repository.dart';
import 'package:the_movie_db/features/home/domain/usecases/get_movie_list.dart';
import 'package:the_movie_db/features/home/presentation/bloc/movie_list_bloc.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector.registerFactory(() => MovieListBloc(
      getMovieListUseCase: injector(),
      movieListState: MovieListState.Empty,
      movieList: []));

  injector.registerFactory(() => Dio());

  injector.registerLazySingleton(() => GetMovieListUseCase(injector()));

  injector.registerLazySingleton<IMovieRemoteDataSource>(
      () => MovieRemoteDataSource(dio: injector()));

  injector.registerLazySingleton<INetworkInfo>(() => NetworkInfo());

  injector.registerLazySingleton<IMovieRepository>(() =>
      MovieRepository(networkInfo: injector(), remoteDataSource: injector()));
}

// poderíamos fazer um método para iniciar as features ou separar o init bonitinho por cada caso void initFeatures() {}
