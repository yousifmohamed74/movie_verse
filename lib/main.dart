import 'package:flutter/material.dart';
import 'package:movie_verse/core/styles/theme_data.dart';
import 'package:movie_verse/features/movie%20details/logic/movie_screen_provider.dart';
import 'package:movie_verse/features/splash%20screen/ui/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(    
      debugShowCheckedModeBanner: false,  
      theme: Themedata.semidarktheme,
      home: SplashScreen(),
    );
  }
}
