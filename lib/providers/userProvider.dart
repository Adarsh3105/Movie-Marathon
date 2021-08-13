//Provider model 
//Usecase: Use when multiple screens require the variable's values
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserProvider extends ChangeNotifier{
  
  bool isLoggedIn;
  bool addingMovie=false;
  GoogleSignIn googleSignIn=GoogleSignIn();
  UserProvider({
    this.isLoggedIn,
    this.googleSignIn,
    this.addingMovie,
  });

bool get getStatus {
    return isLoggedIn;
  }
bool get getMovieStatus {
    return addingMovie;
  }

  void setUser(bool login){
    isLoggedIn=login;
    print('object');
    notifyListeners();
  }
  void addMovie(bool adding){
    adding=adding;
    print('object');
    notifyListeners();
  }

}