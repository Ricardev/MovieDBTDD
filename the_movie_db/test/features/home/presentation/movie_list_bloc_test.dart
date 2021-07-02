import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/states/application_states.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';
import 'package:the_movie_db/features/home/domain/usecases/get_movie_list.dart';
import 'package:the_movie_db/features/home/presentation/bloc/movie_list_bloc.dart';

class MockGetMoviesList extends Mock implements GetMovieListUseCase {}

void main() {
  late MovieListBloc bloc;
  late MockGetMoviesList mockGetMoviesList;
  setUp(() {
    mockGetMoviesList = MockGetMoviesList();
    bloc = MovieListBloc(
        movieListState: MovieListState.Empty,
        getMovieListUseCase: mockGetMoviesList,
        movieList: []);
  });

  test('initial data should be Empty', () async {
    expect(bloc.initialState, equals(MovieListState.Empty));
  });

  group('get MoviesList', () {});
}
