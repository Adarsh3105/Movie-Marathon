import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movie_marathon/API.dart';

class MovieInfo {
  String voteAverage;
  String posterPath;
  String overview;

  MovieInfo({
    this.posterPath,
    this.voteAverage,
    this.overview,
  });

  static Future<MovieInfo> details(String moviename) async {
    try {
      String link =
          'https://api.themoviedb.org/3/search/movie?api_key=429e4fbc91010c82671dbff06605336c';
      var response = await Dio().get('$link&query=$moviename');

      dynamic data = json.decode(response.toString());
      dynamic x = data["results"];
     // print(x);
      if (x.isEmpty) {
        return MovieInfo(
          posterPath: posterNotAvailable,
          overview: '',
          voteAverage: '-',
        );
      }

      dynamic y = x[0];
      if(y['poster_path']==null || y['vote_average']==0){
        return MovieInfo(
        posterPath: posterNotAvailable,
        overview:'',
        voteAverage: '-',
      );
      }
      
      return MovieInfo(
        posterPath: y['poster_path'] == null ? '' : y['poster_path'],
        overview: y["overview"],
        voteAverage: y['vote_average'].toString(),
      );
    } catch (e) {
      print(e);
    }
  }
}
