import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie_verse/core/shared%20prefrances/sharedprefrances.dart';
import 'package:movie_verse/core/styles/theme_data.dart';
import 'package:movie_verse/features/home%20screen/logic/homescreen_provider.dart';
import 'package:movie_verse/features/splash%20screen/ui/splash_screen.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();  
  await SharedPreferencesitem.init(); 
  runApp(
    ChangeNotifierProvider(  
      create: (context) => HomescreenProvider()..getNowPlayingMovies()..getTopRatedMovies()..getTrendingMovies()..getUpcomingMovies(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {  
    return Consumer<HomescreenProvider>(
      builder: (context,val,child) { 
        var provider=context.read<HomescreenProvider>();
        provider.iSDARK=SharedPreferencesitem.getBool("isdark")??false;
        log(provider.iSDARK.toString());                          
        return MaterialApp(
          debugShowCheckedModeBanner: false,
     
          theme:provider.iSDARK ? 
          Themedata.darktheme : 
          Themedata.semidarktheme,
    
          home: SplashScreen(),
          );
        }
    );
  }
}