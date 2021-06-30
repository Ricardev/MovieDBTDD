import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/features/home/data/datasources/Movie_Remote_Data_Source.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MovieRemoteDataSource remoteDataSource;
  late MockDio mockDio;
  setUp(() {
    mockDio = MockDio();
    remoteDataSource = MovieRemoteDataSource(dio: mockDio);
  });
  group('get movies list', () {
    test('should perform a GET request ', () async {
      when(mockDio.get('pipipipopopo')).thenAnswer((_) async =>
          Response(requestOptions: RequestOptions(path: 'pipipipopopo')));

      remoteDataSource.getMoviesList();
      verify(mockDio.get(
          'https://api.themoviedb.org/3/movie/popular?api_key=8e1f3490365a847b0355d560842ce17e&language=en-US&page=1'));
    });
  });
}
