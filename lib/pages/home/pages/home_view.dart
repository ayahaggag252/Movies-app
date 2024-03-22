import 'package:flutter/material.dart';
import 'package:movies/model/movies.dart';
import 'package:movies/network/api_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<Movie>> upcomingMovies;

  late Future<List<Movie>> popularMovies;

  late Future<List<Movie>> topRatedMovies;


  @override
  void initState() {

    upcomingMovies = ApiManager().getupComingMovies();
    popularMovies =ApiManager().getpopularMovies();
    topRatedMovies=ApiManager().gettopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor:Colors.black ,
  appBar: AppBar(
backgroundColor: Colors.black,
  foregroundColor: Colors.white,
  title: Text("Dora"),
    centerTitle: true,

  ),

  body: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Upcoming', style: TextStyle(color: Colors.white),
        ),
        FutureBuilder(
            future: upcomingMovies,
            builder: (context , snapchot){
              if(!snapchot.hasData){
                return const Center(child: CircularProgressIndicator(),);
              }
              final movies =snapchot.data!;
              return CarouselSlider.builder(itemCount: movies.length,
                  itemBuilder: (context, index , movieIndex){
                final movie = movies[index];
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Image.network("https://image.tmdb.org/t/p/original/${movie.backDropPath}"),
                );
                  },
              options: CarouselOptions(),);
            },
            )
      ],
    ),
  ),
);

   /* return Column(

      children: [

        Container(

          height: 289,

        ),
        const SizedBox(
          height: 50,
        ),
        Container(),
        const SizedBox(
          height: 50,
        ),
        Container(),
      ],
    );*/
  }
}
