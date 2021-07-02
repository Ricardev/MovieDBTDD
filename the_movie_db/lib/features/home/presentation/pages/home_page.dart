import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:the_movie_db/core/states/application_states.dart';
import 'package:the_movie_db/features/home/domain/usecases/get_movie_list.dart';
import 'package:the_movie_db/features/home/presentation/bloc/movie_list_bloc.dart';
import 'package:the_movie_db/injection/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MovieListBloc movieListBloc;
  late Connectivity connectivity;
  late Dio dio;

  @override
  void initState() {
    connectivity = Connectivity();
    dio = Dio();
    final movieListUseCase = injector.get<GetMovieListUseCase>();
    movieListBloc = MovieListBloc(
        getMovieListUseCase: movieListUseCase,
        movieListState: MovieListState.Empty,
        movieList: []);
    movieListBloc.getMovieListUseCase(NoParams());
    movieListBloc.getMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home Page'),
        ),
        body: buildBody(context, movieListBloc));
  }
}

BlocProvider<MovieListBloc> buildBody(
    BuildContext context, MovieListBloc movieListBloc) {
  return BlocProvider(
    create: (_) => injector<MovieListBloc>(),
    child: Observer(builder: (_) {
      if (movieListBloc.movieListState == MovieListState.Empty) {
        return Center(
            child: CircularProgressIndicator(
          color: Colors.blue,
        ));
      } else if (movieListBloc.movieListState == MovieListState.Loading) {
        return Center(
            child: CircularProgressIndicator(
          color: Colors.blue,
        ));
      } else if (movieListBloc.movieListState == MovieListState.Loaded) {
        return BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            return Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Observer(builder: (_) {
                  return GridView.builder(
                      itemCount: movieListBloc.movieList?.length ?? 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Observer(
                            builder: (_) => Container(
                                  height: 10,
                                  width: 20,
                                  child: Text(movieListBloc
                                          .movieList?[index].original_title ??
                                      'Sem título para este filme'),
                                ));
                      });
                }));
          },
        );
      } else {
        return Container();
      }
    }),
  );
}
