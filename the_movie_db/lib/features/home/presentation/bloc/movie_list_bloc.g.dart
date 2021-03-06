// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieListBloc on _MovieListBlocBase, Store {
  final _$movieListStateAtom = Atom(name: '_MovieListBlocBase.movieListState');

  @override
  MovieListState get movieListState {
    _$movieListStateAtom.reportRead();
    return super.movieListState;
  }

  @override
  set movieListState(MovieListState value) {
    _$movieListStateAtom.reportWrite(value, super.movieListState, () {
      super.movieListState = value;
    });
  }

  final _$movieListAtom = Atom(name: '_MovieListBlocBase.movieList');

  @override
  List<MovieEntity>? get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(List<MovieEntity>? value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  final _$getMovieListAsyncAction =
      AsyncAction('_MovieListBlocBase.getMovieList');

  @override
  Future<void> getMovieList() {
    return _$getMovieListAsyncAction.run(() => super.getMovieList());
  }

  @override
  String toString() {
    return '''
movieListState: ${movieListState},
movieList: ${movieList}
    ''';
  }
}
