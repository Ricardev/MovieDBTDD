import 'package:mobx/mobx.dart';
import 'package:the_movie_db/core/states/application_states.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_entity.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';
import 'package:the_movie_db/features/home/domain/usecases/get_movie_list.dart';
import 'package:the_movie_db/features/home/presentation/bloc/movie_list_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_list_bloc.g.dart';

class MovieListBloc = _MovieListBlocBase with _$MovieListBloc;

abstract class _MovieListBlocBase extends Bloc<MovieListEvent, MovieListState>
    with Store {
  _MovieListBlocBase(
      {required this.movieListState,
      required this.getMovieListUseCase,
      required this.movieList})
      : super(movieListState);

  final GetMovieListUseCase getMovieListUseCase;

  @observable
  MovieListState movieListState;

  @override
  MovieListState get initialState => MovieListState.Empty;

  @observable
  List<MovieEntity>? movieList;

  @action
  Future<void> getMovieList() async {
    movieListState = MovieListState.Loading;
    final failureOrMovieList = await getMovieListUseCase(NoParams());
    await failureOrMovieList.fold((l) => throw UnimplementedError(),
        (movieListResponse) {
      movieList = movieListResponse.movieList;
      movieListState = MovieListState.Loaded;
    });
  }

  @override
  Stream<MovieListState> mapEventToState(MovieListEvent event) async* {
    if (event is GetMovieList) {}
  }
}
