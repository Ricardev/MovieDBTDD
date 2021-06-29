import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? poster_path;
  final String? overview;
  final String? release_date;
  final int id;
  final String? original_title;
  final double? vote_average;
  MovieEntity(
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
