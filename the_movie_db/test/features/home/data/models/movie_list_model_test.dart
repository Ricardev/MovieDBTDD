// @dart=2.9
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/features/home/data/models/movie_model.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_entity.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tMovieModel = MovieModel(
      id: 297761,
      poster_path: '/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg',
      overview:
          "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
      release_date: "2016-08-03",
      original_title: "Suicide Squad",
      vote_average: 5.91);

  test('should be a subclass of MovieEntity', () async {
    expect(tMovieModel, isA<MovieEntity>());
  });

  group('from Json', () {
    test('should return valid Json', () async {
      final Map<String, dynamic> fromJson = json.decode(fixture('movie.json'));
      final result = MovieModel.fromJson(fromJson);
      expect(result, equals(tMovieModel));
    });
  });
}
