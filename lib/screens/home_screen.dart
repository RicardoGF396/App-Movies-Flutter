import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Trae la información del MoviesProvider y guardala en esta variable
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Movieflu'),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: (() => showSearch(context: context, delegate: MovieSearchDelegate())))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              const SizedBox(height: 30),
              // Slider de películas
              MovieSlider(
                  movies: moviesProvider.popularMovies, title: 'Populares!',onNextPage:() => moviesProvider.getPopularMovies())
            ],
          ),
        ));
  }
}
