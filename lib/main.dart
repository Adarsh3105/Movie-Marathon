import 'package:flutter/material.dart';
import 'package:movie_marathon/providers/userProvider.dart';
import 'package:movie_marathon/style/colors.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,690),
      builder:()=> MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          primaryColor: primaryColor,
          accentColor: accentColor,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<UserProvider>(create: (_)=> UserProvider(isLoggedIn: false)),
          ],
          child: Home()),
      ),
    );
  } 
}   
