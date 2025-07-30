import 'package:flutter/material.dart';
import 'package:movie_verse/features/home%20screen/logic/homescreen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomescreenProvider()..getTrendingMovies()
      ..getNowPlayingMovies()
      ..getTopRatedMovies()
      ..getUpcomingMovies(),
      child: Scaffold(

        appBar: AppBar(
          title: Row(
            spacing: 7,
            children: [
              Image.asset(
                "assets/images/sp4.png",
                width: 30,
                height: 30,
              ),
              Text("Movie Verse",style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold
              ),), 
            ],
          ),
          //centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.search,size: 30,))
          ],
        ), 

        body: Consumer<HomescreenProvider>(
          builder: (context,child,val) {
            var provider=context.read<HomescreenProvider>();
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text("data"),
                  ],
                ),
              )
            );
          }
        ),
      ),
    );
  }
}