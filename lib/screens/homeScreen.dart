///Dashboard screen with list of movies added

import 'package:flutter/material.dart';
import 'package:movie_marathon/API.dart';
import 'package:movie_marathon/database/databasehelper.dart';
import 'package:movie_marathon/models/movie.dart';
import 'package:movie_marathon/style/buttons.dart';
import 'package:movie_marathon/style/colors.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  HomeScreen({this.email});
  @override
  _HomeScreenState createState() => _HomeScreenState(email: email);
}

class _HomeScreenState extends State<HomeScreen> {
  String email;
  _HomeScreenState({this.email});

  final DBMovieList dbMovieList = new DBMovieList();
  Movie movie;
  List<Movie> movieList;
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _directorController = TextEditingController();
  int updateindex;


  Form movieForm() {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  height: 140.h,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/posters/collage.jpg',
                    height: 140.h,
                    fit: BoxFit.fill,
                  )),
              Container(
                height: 40.h,
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Name"),
                  controller: _nameController,
                  validator: (val) =>
                      val.isNotEmpty ? null : "Name Should not be Empty",
                ),
              ),
              Container(
                height: 40.h,
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Director"),
                  controller: _directorController,
                  validator: (val) =>
                      val.isNotEmpty ? null : "Director Should not be Empty",
                ),
              ),
              Container(
                height: 30.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: accentColor),
                  child: Container(
                    //height: ,
                    child: Text(
                      "Submit",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPressed: () async {
                    MovieInfo info =
                        await MovieInfo.details(_nameController.text);
                    submitMovie(context, info);
                    Navigator.pop(context);
                  },
                ),
              ),
            ]),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: primaryColor,
          onPressed: () {
            showDialog( 
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                        height: 320.h,
                        decoration: formGradient,
                        child: movieForm()),
                    //
                  );
                });
          },
        ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: accentColor,
          title: Text("My List"),
          centerTitle: true,
        ),
       
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor,
                ]),
          ),
          child: ListView(
            shrinkWrap: false,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                child: FadeInDown(
                  child: Center(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                    'My Collection',
                    style: centre,
                  ),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: dbMovieList.getMovieList(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return CircularProgressIndicator();
                  else if (snapshot.hasError) return Text('Error loading data');

                  movieList = snapshot.data;
                  List<Movie> sortedList = [];
                  int i = 0;
                  while (i < movieList.length) {
                    if (movieList[i].profile == email) {
                      sortedList.add(movieList[i]);
                    }
                    i++;
                  }
                  if (sortedList.length == 0) {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.movie,
                            size: 50,
                          ),
                          //Image.asset('assets/posters/empty.jpg',width: ,),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Click on + to add",
                            style: TextStyle(
                                color: accentColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: sortedList == null ? 0 : sortedList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (sortedList == null) {
                          return Text('No movies added yet!');
                        }
                        Movie mv = sortedList[index];
                        return FadeInRight(
                          child: Container(
                            height: 130.h,
                            child: Card(
                              elevation: 4,
                              color: Colors.black.withOpacity(0.5),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          //color: Colors.black,
                                          child: Image(
                                              image: NetworkImage(
                                                  mv.rating == '-'
                                                      ? mv.poster
                                                      : posterBase + mv.poster),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: Text(
                                                  mv.name,
                                                  style: info,
                                                ),
                                              ),
                                            ),
                                            FittedBox(
                                                fit: BoxFit.cover,
                                                child: Text(
                                                  'Director: ${mv.director}',
                                                  style: details,
                                                )),
                                            FittedBox(
                                                fit: BoxFit.cover,
                                                child: Text(
                                                  'Rating: ${mv.rating}',
                                                  style: details,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            _nameController.text = mv.name;
                                            _directorController.text =
                                                mv.director;
                                            movie = mv;
                                            updateindex = index;
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                      child: Container(
                                                          decoration:
                                                              formGradient,
                                                          height: 320.h,
                                                          child: movieForm()));
                                                });
                                            //ScaffoldMessenger.of(context).showSnackBar(noteSnackBar);
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            dbMovieList.deleteMovie(mv.id);
                                            setState(() {
                                              movieList.removeAt(index);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
        ));
  }

  void submitMovie(BuildContext context, MovieInfo info) {
    if (movie == null) {
      Movie mv = new Movie(
        name: _nameController.text,
        director: _directorController.text,
        poster: info.posterPath,
        overview: info.overview,
        rating: info.voteAverage.toString(),
        profile: email,
      );

      dbMovieList.insertMovie(mv).then((value) => {
            setState(() {
              bool j = false;
            }),
            _nameController.clear(),
            _directorController.clear(),
            print("Movie Data Add to database $value"),
          });
    } else {
      movie.name = _nameController.text;
      movie.director = _directorController.text;
      dbMovieList.updateMovie(movie).then((value) {
        setState(() {
          movieList[updateindex].name = _nameController.text;
          movieList[updateindex].director = _directorController.text;
        });
        _nameController.clear();
        _directorController.clear();
        movie = null;
      });
    }
  }
}
