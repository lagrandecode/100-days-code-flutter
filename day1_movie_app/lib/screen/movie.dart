import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../model/api_model.dart';
import '../service/api_service.dart';
import 'detail_screen.dart';

class MovieDisplay extends StatefulWidget {
  const MovieDisplay({super.key});

  @override
  State<MovieDisplay> createState() => _MovieDisplayState();
}

class _MovieDisplayState extends State<MovieDisplay> {
  late Future<List<Movie>> _moviesFuture;
  int current = 0;

  @override
  void initState() {
    super.initState();
    _moviesFuture = ApiService().fetchMovie();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<List<Movie>>(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No movies available.',
                style: TextStyle(fontSize: 18, color: Colors.black45),
              ),
            );
          }

          final movies = snapshot.data!;
          return SizedBox(
            height: size.height,
            child: Stack(
              children: [
                // Background image
                Image.network('https://movie3-d7a456930263.herokuapp.com${movies[current].image!}'
                  ,
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.grey.shade50.withOpacity(1),
                          Colors.grey.shade50.withOpacity(0.8),
                          Colors.grey.shade100.withOpacity(0.0),
                        ],
                      ),
                    ),
                  ),
                ),
                // Carousel slider
                Positioned(
                  bottom: 5,
                  height: size.height * 0.7,
                  width: size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 550,
                      viewportFraction: 0.7,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      },
                    ),
                    items: movies.map((movie) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => DetailScreen(movie: movie),
                          //   ),
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Hero(
                                  tag: movie.title,
                                  child: Container(
                                    height: 350,
                                    width: size.width * 0.55,
                                    margin: const EdgeInsets.only(top: 20),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.network("https://movie3-d7a456930263.herokuapp.com${movie.image!}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  movie.director!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 20),
                                        const SizedBox(width: 5),
                                        Text(
                                          movie.rating!,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.access_time, color: Colors.black45, size: 20),
                                        const SizedBox(width: 5),
                                        Text(
                                          movie.duration!,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
//AASSAAS