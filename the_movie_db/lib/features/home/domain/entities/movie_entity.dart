import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String? poster_path;
  final String? overview;
  final String? release_date;
  final String id;
  final String? original_title;
  final double? vote_average;
  Movie(
      {required this.id,
      this.original_title,
      this.overview,
      this.poster_path,
      this.release_date,
      this.vote_average});
  @override
  List<dynamic> get props =>
      [poster_path, overview, release_date, id, original_title, vote_average];
}
