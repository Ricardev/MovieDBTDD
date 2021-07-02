import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie_db/core/network/network_info.dart';
import 'package:the_movie_db/features/home/data/datasources/Movie_Remote_Data_Source.dart';
import 'package:the_movie_db/features/home/data/repositories/movie_repository.dart';
import 'package:the_movie_db/features/home/domain/entities/movie_list_entity.dart';
import 'package:the_movie_db/features/home/domain/repositories/Imovie_repository.dart';
import 'package:the_movie_db/features/home/domain/usecases/get_movie_list.dart';
import 'package:the_movie_db/features/home/presentation/bloc/movie_list_bloc.dart';
import 'package:the_movie_db/features/home/presentation/bloc/movie_list_state.dart';
import 'package:the_movie_db/injection/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IMovieRepository movieRepository;
  late GetMovieListUseCase movieListUseCase;
  late MovieListBloc movieListBloc;
  late INetworkInfo networkInfo;
  late IMovieRemoteDataSource movieRemoteDataSource;
  late Connectivity connectivity;
  late Dio dio;
  @override
  void initState() {
    connectivity = Connectivity();
    dio = Dio();
    final movieListUseCase = injector.get<GetMovieListUseCase>();
    injector.get<IMovieRepository>();
    injector.get<INetworkInfo>();
    injector.get<IMovieRemoteDataSource>();
    movieListBloc = injector.get<MovieListBloc>();
    movieListBloc = MovieListBloc(
        getMovieListUseCase: movieListUseCase,
        initialState: Empty(),
        movieList: MovieListEntity());

    movieListBloc.getMovieListUseCase(NoParams());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home Page'),
        ),
        body: buildBody());
  }
}

BlocProvider<MovieListBloc> buildBody() {
  return BlocProvider(
    create: (_) => injector<MovieListBloc>(),
    child: Observer(builder: (_) {
      return Column(
        children: [
          BlocBuilder<MovieListBloc, MovieListState>(
            builder: (context, state) {
              if (state is Empty) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                ));
              } else if (state is Loading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                ));
              } else if (state is Loaded) {
                return Expanded(
                    child: GridView.builder(
                        itemCount: BlocProvider.of<MovieListBloc>(context)
                            .movieList
                            .movieList
                            ?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Container();
                        }));
              } else {
                return Container();
              }
            },
          ),
        ],
      );
    }),
  );
}
