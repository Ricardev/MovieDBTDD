// @dart=2.9
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_entity.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';
import 'package:the_movie_db/features/home/domain/repositories/Imovie_repository.dart';
import 'package:the_movie_db/features/home/domain/usecases/get_movie_list.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  GetMovieListUseCase usecase;
  MockMovieRepository mockMovieRepository;
  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetMovieListUseCase(mockMovieRepository);
  });
  mockMovieRepository = MockMovieRepository();
  usecase = GetMovieListUseCase(mockMovieRepository);
  test('should get the movies list', () async {
    final movies = MovieListEntity();

    when(mockMovieRepository.getMoviesList())
        .thenAnswer((realInvocation) async => Right(movies));

    final result = await usecase(NoParams());
    expect(result, Right(movies));
  });
}
