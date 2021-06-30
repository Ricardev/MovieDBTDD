// @dart=2.9
import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/error/exceptions.dart';
import 'package:the_movie_db/core/error/failures.dart';
import 'package:the_movie_db/core/network/network_info.dart';
import 'package:the_movie_db/features/home/data/datasources/Movie_Remote_Data_Source.dart';
import 'package:the_movie_db/features/home/data/models/movie_model.dart';
import 'package:the_movie_db/features/home/data/repositories/movie_repository.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';

class MockRemoteDataSource extends Mock implements IMovieRemoteDataSource {}

class MockNetworkInfo extends Mock implements INetworkInfo {}

void main() {
  MovieRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = MovieRepository(
      networkInfo: mockNetworkInfo,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('get movies list', () {
    final tMovieModel = MovieModel(
        id: 297761,
        poster_path: '/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg',
        overview:
            "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
        release_date: "2016-08-03",
        original_title: "Suicide Squad",
        vote_average: 5.91);
    final tmovies = MovieListEntity(movieList: [tMovieModel]);

    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => ConnectivityResult.wifi);
      repository.getMoviesList();
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((_) async => ConnectivityResult.wifi);
      });
      test('should return remote data when the call to remote data is fine',
          () async {
        when(mockRemoteDataSource.getMoviesList())
            .thenAnswer((_) async => tmovies);

        final result = await repository.getMoviesList();
        verify(mockRemoteDataSource.getMoviesList());
        expect(result, equals(Right(tmovies)));
      });
      test(
          'should return Server Exception when the call to remote data is unssucessefull',
          () async {
        when(mockRemoteDataSource.getMoviesList())
            .thenThrow((ServerExceptions()));

        final result = await repository.getMoviesList();
        verify(mockRemoteDataSource.getMoviesList());
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });
}
