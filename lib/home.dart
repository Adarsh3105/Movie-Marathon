//Homescreen of the application
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_marathon/providers/userProvider.dart';
import 'package:movie_marathon/screens/homeScreen.dart';
import 'package:movie_marathon/style/buttons.dart';
import 'package:movie_marathon/style/colors.dart';
import 'package:movie_marathon/widgets/caraousel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  GoogleSignInAccount account;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final snackBar = SnackBar(content: Text('Internet connection unavailable!'));
  bool indicator = false;

  Scaffold authenticated() {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image(image: NetworkImage(account.photoUrl)),
            ),
          )
        ],
        backgroundColor: accentColor,
        title: Text(
          'Movie Marathon',
          style: info,
        ),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: accentColor,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/posters/bgimage.jpg'),
          ),
        ),
        child: ListView(
           
            children: [
              Container(
                //color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: FadeInLeft(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 30),
                            child: Text(
                                "Welcome,\n        ${account.displayName.split(" ")[0]}!",
                                style: greet),
                          ),
                        ),
                      ),
                    ),
                    FadeInRight(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: whiteColor),
                            child: Text(
                              'Go to Collection',
                              style: TextStyle(color: accentColor),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeScreen(email: account.id),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      decoration: whiteGreyGradiet,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "IMDb top rated:",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Container(
                      height: 120.h,
                      width: MediaQuery.of(context).size.width,
                      child: customCarousel(
                        context,
                        [
                          Image.asset('assets/posters/movies/m1.jpg',
                              fit: BoxFit.fill),
                          Image.asset(
                            'assets/posters/movies/m2.jpg',
                            fit: BoxFit.fill,
                          ),
                          Image.asset('assets/posters/movies/m3.jpg',
                              fit: BoxFit.fill),
                          Image.asset('assets/posters/movies/m4.jpg',
                              fit: BoxFit.fill),
                          Image.asset('assets/posters/movies/m5.jpg',
                              fit: BoxFit.fill),
                          Image.asset('assets/posters/movies/m7.jpg',
                              fit: BoxFit.fill),
                          Image.asset('assets/posters/movies/m8.jpg',
                              fit: BoxFit.fill),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: whiteGreyGradiet,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Cult Classics:",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  FadeInUp(
                      child: customCarousel(
                    context,
                    [
                      Image.asset('assets/posters/movies/m9.jpg',
                          fit: BoxFit.fill),
                      Image.asset(
                        'assets/posters/movies/m15.jpg',
                        fit: BoxFit.fill,
                      ),
                      Image.asset('assets/posters/movies/m10.jpg',
                          fit: BoxFit.fill),
                      Image.asset('assets/posters/movies/m11.jpg',
                          fit: BoxFit.fill),
                      Image.asset('assets/posters/movies/m12.jpg',
                          fit: BoxFit.fill),
                      Image.asset('assets/posters/movies/m13.jpeg',
                          fit: BoxFit.fill),
                      Image.asset('assets/posters/movies/m14.jpg',
                          fit: BoxFit.fill),
                    ],
                  )),
                  Container(
                    decoration: whiteGreyGradiet,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Oscar winning movies:",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  FadeInUp(
                    child: Container(
                        height: 120.h,
                        width: MediaQuery.of(context).size.width,
                        child: customCarousel(
                          context,
                          [
                            Image.asset('assets/posters/movies/m10.jpg',
                                fit: BoxFit.fill),
                            Image.asset(
                              'assets/posters/movies/m2.jpg',
                              fit: BoxFit.fill,
                            ),
                            Image.asset('assets/posters/movies/m13.jpeg',
                                fit: BoxFit.fill),
                            Image.asset('assets/posters/movies/m4.jpg',
                                fit: BoxFit.fill),
                            Image.asset('assets/posters/movies/m15.jpg',
                                fit: BoxFit.fill),
                            // Image.asset('assets/posters/movies/m6.jpg'),
                            Image.asset('assets/posters/movies/m6.jpg',
                                fit: BoxFit.fill),
                            Image.asset('assets/posters/movies/m8.jpg',
                                fit: BoxFit.fill),
                          ],
                        )),
                  ),
                ],
              ),
              
              Center(
                child: ElevatedButton(
                  style: log,
                  child: Text(
                    "Logout",
                  ),
                  onPressed: () {
                    _googleSignIn.signOut().then((value) {
                      Provider.of<UserProvider>(context, listen: false)
                          .setUser(false);
                    }).catchError((e) {
                      print(e);
                    });
                  },
                ),
              )
            ]),
      ),
    );
  }

  Scaffold unauthenticated() {
    return Scaffold(
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
            child: Stack(fit: StackFit.expand, children: [
              Image.asset(
                'assets/posters/collage2.jpg',
                fit: BoxFit.fill,
              ),
              Container(
                color: accentColor.withOpacity(0.4),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //height: 200.h,
                      color: Colors.black,
                      child: Image.asset(
                        'assets/posters/logo2.jpg',width: 250.h,height: 100.h,
                      ),
                    ),
                    
                    Provider.of<UserProvider>(context).getStatus
                        ? ElevatedButton(
                            style: log,
                            child: Text(
                              "Logout",
                            ),
                            onPressed: () {
                              _googleSignIn.signOut().then((value) {
                                setState(() {
                                  UserProvider().isLoggedIn = false;
                                });
                              }).catchError((e) {
                                print(e);
                              });
                            },
                          )
                        : ElevatedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: indicator
                                  ? CircularProgressIndicator(
                                      backgroundColor: primaryColor,
                                    )
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20, color: accentColor),
                                    ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                indicator = true;
                              });
                              await _googleSignIn.signIn().then((userData) {
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .setUser(true);
                                setState(() {
                                  account = userData;
                                  indicator = false;
                                });
                              }).catchError((e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                print('Internet connection unavailable');
                                print(e);
                              });
                            },
                          ),
                  ],
                ),
              ),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getStatus;

    return user ? authenticated() : unauthenticated();
  }
}
