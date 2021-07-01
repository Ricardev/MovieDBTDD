import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/features/home/data/datasources/Movie_Remote_Data_Source.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_entity.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MovieRemoteDataSource remoteDataSource;
  late MockDio mockDio;
  setUp(() {
    mockDio = MockDio();
    remoteDataSource = MovieRemoteDataSource(dio: mockDio);
  });
  group('get movies list', () {
    MovieEntity movieListEntity = MovieEntity(
        id: 297761,
        poster_path: '/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg',
        overview:
            "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
        release_date: "2016-08-03",
        original_title: "Suicide Squad",
        vote_average: 5.91);
    test('should perform a GET request ', () async {
      when(mockDio.get('pipipipopopo')).thenAnswer((_) async =>
          Response(requestOptions: RequestOptions(path: 'pipipipopopo')));
      when(remoteDataSource.getMoviesList()).thenAnswer(
          (realInvocation) async =>
              Future.value(MovieListEntity(movieList: [movieListEntity])));

      await remoteDataSource.getMoviesList();
      verify(mockDio.get(
          'https://api.themoviedb.org/3/movie/popular?api_key=8e1f3490365a847b0355d560842ce17e&language=en-US&page=1'));
    });
  });
}
