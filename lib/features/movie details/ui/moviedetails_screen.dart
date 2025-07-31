import 'package:flutter/material.dart';
import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';
import 'package:movie_verse/features/movie%20details/logic/movie_screen_provider.dart';
import 'package:movie_verse/features/movie%20details/ui/widgets/moviedetails_elements_wid.dart';
import 'package:movie_verse/features/movie%20details/ui/widgets/moviedetails_phots_wid.dart';
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
            String geners="";
            for(int i=0;i<provider.currentmovieGenres.length;i++){
              geners+="${provider.currentmovieGenres[i]} ${i<provider.currentmovieGenres.length-1?",":""}";
            } 
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    spacing: 9,
                    children: [ 
                      
                      MoviedetailsPhotsWid(movie: movie,),
                      SizedBox(height: 50,),
                      MoviedetailsElementsWid(
                        text1: "Oreginal Language : ",
                        text2: movie.originallanguage.toString(),
                        maxlines: 1,                       
                      ),
                      
                      MoviedetailsElementsWid(
                        text1: "Release Date : ",
                        text2: movie.releasedate,
                        maxlines: 1,                       
                      ),
                      
                      MoviedetailsElementsWid(
                        text1: "Popularity : ",
                        text2: movie.popularity.toString(),
                        maxlines: 1,                       
                      ),

                      MoviedetailsElementsWid(
                        text1: "Genres : ",
                        text2: geners,
                        maxlines: 1,                       
                      ),

                      MoviedetailsElementsWid(
                        text1: "Adult : ",
                        text2: movie.adult.toString(),
                        maxlines: 1,                       
                      ),
                  
                      MoviedetailsElementsWid(
                        text1: "Vote Average : ",
                        text2: movie.voteaverage.toString(),
                        maxlines: 1,                       
                      ),
                     
                      MoviedetailsElementsWid(
                        text1: "Vote Count : ",
                        text2: movie.votecount.toString(),
                        maxlines: 1,                       
                      ),                                         
                    
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(                            
                            "OverView : ",style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600
                          ),),
                          Text(
                            maxLines: 15,
                            overflow: TextOverflow.ellipsis,
                            movie.overview,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      
      ),
    );
  }
}