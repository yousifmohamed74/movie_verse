import 'package:flutter/material.dart';
import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';
import 'package:movie_verse/features/movie%20details/logic/movie_screen_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MovieDetailsScreen extends StatelessWidget {
  MovieModel movie;
   MovieDetailsScreen({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieDetailsScreenProvider()..getAllGenres(),
      child: Scaffold(
      
        appBar: AppBar(
          title: Text(movie.title,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),),
          centerTitle: true,
          iconTheme: IconThemeData(
            size: 29
          ),
        ),
        
        body: Consumer<MovieDetailsScreenProvider>(
          builder: (context,val,child) {
            var provider=context.read<MovieDetailsScreenProvider>();
            provider.getmovieGenres(movie.genreids);
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    MaterialButton(
                      child: Text("tap"),
                      onPressed: (){                        
                        print(movie.genreids.length);
                        print(provider.allgenres.length);
                        print(provider.currentmovieGenres.length);
                    }),
                    Row(
                      children: [
                        Text("Genres : "),
                        for(int i=0;i<provider.currentmovieGenres.length;i++)
                        Text("${provider.currentmovieGenres[i]}  ",style: TextStyle(

                        ),),
                        
                      ],
                    ),
                     
                    Stack(children: [
                      
                    ],)
                    
                  ],
                ),
              ),
            );
          }
        ),
      
      ),
    );
  }
}