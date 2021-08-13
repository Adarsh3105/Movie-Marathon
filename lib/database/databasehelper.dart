//Database helper class
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBMovieList {
  Database _datebase;

  Future openDB() async {
    if (_datebase == null) {
      _datebase = await openDatabase(
          join(await getDatabasesPath(), "movies.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE movie(id INTEGER PRIMARY KEY AUTOINCREMENT,profile TEXT,name TEXT,director TEXT,poster TEXT,overview TEXT,rating TEXT)");
      });
    }
   
  }

  Future<int> insertMovie(Movie movie) async {
    await openDB();
    return await _datebase.insert('movie',movie.toMap());
  }
 

  Future<List<Movie>> getMovieList() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _datebase.query('movie');

    return List.generate(maps.length, (index) {
      return Movie(
          id: maps[index]['id'],
          name: maps[index]['name'],
          director: maps[index]['director'],
          poster: maps[index]['poster'],
          overview: maps[index]['overview'],
          rating: maps[index]['rating'],
          profile:maps[index]['profile'],
          );
    });
  }

  Future<int> updateMovie(Movie movie) async {
    await openDB();
    return await _datebase.update('movie',movie.toMap(),
        where: 'id=?', whereArgs: [movie.id]);
  }

  Future<void> deleteMovie(int id) async {
    await openDB();
    await _datebase.delete('movie',where: "id = ? ", whereArgs: [id]);
  }
}

class Movie {
  int id;
  String name;
  String director;
  String poster;
  String overview;
  String rating;
  String profile;

  Movie({@required this.profile, @required this.name, @required this.director,@required this.poster,this.overview,this.rating,this.id,});
  Map<String, dynamic> toMap() {
    return {'profile':profile,'name': name, 'director': director,'poster':poster,'overview':overview,'rating':rating};
  }
}