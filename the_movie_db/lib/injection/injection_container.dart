import 'package:get_it/get_it.dart';
import 'package:the_movie_db/core/network/network_info.dart';
import 'package:the_movie_db/features/home/data/datasources/Movie_Remote_Data_Source.dart';
import 'package:the_movie_db/features/home/data/repositories/movie_repository.dart';
import 'package:the_movie_db/features/home/domain/repositories/Imovie_repository.dart';
import 'package:the_movie_db/features/home/domain/usecases/get_movie_list.dart';
import 'package:the_movie_db/features/home/presentation/bloc/movie_list_bloc.dart';
import 'package:the_movie_db/features/home/presentation/bloc/movie_list_state.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector.registerFactory(() =>
      MovieListBloc(getMovieListUseCase: injector(), initialState: Empty()));

  injector.registerLazySingleton(() => GetMovieListUseCase(injector()));

  injector.registerLazySingleton<IMovieRepository>(() =>
      MovieRepository(networkInfo: injector(), remoteDataSource: injector()));

  injector.registerLazySingleton<IMovieRemoteDataSource>(
      () => MovieRemoteDataSource(dio: injector()));

  injector.registerLazySingleton<INetworkInfo>(
      () => NetworkInfo(connectivity: injector()));
}

// poderíamos fazer um método para iniciar as features ou separar o init bonitinho por cada caso void initFeatures() {}
