import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/core/config/constants.dart';
import 'package:movies/model/movies.dart';

class ApiManager {

  final upComingApiUrl="https://api.themoviedb.org/3/movie/upcoming?apikey=4dacb5fae489f40043e73d05e50977a8";
  final popularApiUrl="https://api.themoviedb.org/3/movie/popular?apikey=4dacb5fae489f40043e73d05e50977a8";
  final topRatedApiUrl="https://api.themoviedb.org/3/movie/top_rated?apikey=4dacb5fae489f40043e73d05e50977a8";

  Future<List<Movie>> getupComingMovies() async{
    final response = await http.get(Uri.parse(upComingApiUrl));
    
    if (response.statusCode ==200){
      final List<dynamic> data =jsonDecode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
  }else{
    throw Exception('Failed to load upcoming movies');
    }
    }

  Future<List<Movie>> getpopularMovies() async{

    final response = await http.get(Uri.parse(popularApiUrl));

    if (response.statusCode ==200){
      final List<dynamic> data =jsonDecode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    }else{
      throw Exception('Failed to load popular movies');
    }
  }

  Future<List<Movie>> gettopRatedMovies() async{
    final response = await http.get(Uri.parse(topRatedApiUrl));

    if (response.statusCode ==200){
      final List<dynamic> data =jsonDecode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    }else{
      throw Exception('Failed to load topRated movies');
    }
  }
/*  static fetchdatamovie () async{
    var url = Uri.https(
      Constants.baseUrl,
      "https://api.themoviedb.org/3/movie/popular",
        {"apiKey": Constants.apiKey },
    );
   final response = await http.get(url);
  if (response.statusCode ==200){
    print(response.body);
  }
  }*/
}