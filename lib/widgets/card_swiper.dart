import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Identificar tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    if (movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const CircularProgressIndicator(),
      );
    }

    return (SizedBox(
        width: double.infinity,
        //Obtenemos la mitad de la pantalla
        height: size.height * 0.70,
        child: Swiper(
          itemBuilder: (context, index) {
            final movie = movies[index];

            movie.heroId = 'swiper-${movie.id}';

            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: movie),
              child: Hero(
                tag: movie.heroId!,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(movie.fullPosterImg),
                      fit: BoxFit.cover,
                    )),
              ),
            );
            //Image.asset('assets/no-image.jpg')
          },
          itemCount: movies.length,
          viewportFraction: 0.85,
          scale: 0.95,
        )));
  }
}
