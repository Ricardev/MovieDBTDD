import 'package:mobx/mobx.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';
import 'package:the_movie_db/features/home/domain/usecases/get_movie_list.dart';
import 'package:the_movie_db/features/home/presentation/bloc/movie_list_event.dart';
import 'package:the_movie_db/features/home/presentation/bloc/movie_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_list_bloc.g.dart';

class MovieListBloc = _MovieListBlocBase with _$MovieListBloc;

abstract class _MovieListBlocBase extends Bloc<MovieListEvent, MovieListState>
    with Store {
  _MovieListBlocBase(
      {required MovieListState initialState,
      required this.getMovieListUseCase,
      required this.movieList})
      : super(initialState);

  final GetMovieListUseCase getMovieListUseCase;

  @override
  MovieListState get initialState => Empty();

  @observable
  final MovieListEntity movieList;

  @override
  @action
  Stream<MovieListState> mapEventToState(MovieListEvent event) async* {
    if (event is GetMovieList) {
      yield Loading();
      final failureOrMovieList = await getMovieListUseCase(NoParams());
      await failureOrMovieList.fold((l) => throw UnimplementedError(),
          (_) => Loaded(movieList: movieList));
    }
  }
}
