import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/core/api/api_constants.dart';
import 'package:movie_verse/core/styles/colors.dart';
import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';
import 'package:movie_verse/features/movie%20details/ui/moviedetails_screen.dart';

// ignore: must_be_immutable
class MovieShape2Wid extends StatelessWidget {
  MovieModel movie;
   MovieShape2Wid({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie,),)
        );
      },
      child: Container(
        height: 135,
        //width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: SemiDarkThemeColors.searchBarBackground,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            spacing: 15,
            children: [
              CachedNetworkImage(
                imageUrl:movie.posterpath.isNotEmpty?
                ApiConstants.imagebaseUrl+movie.posterpath:
                'https://upload.wikimedia.org/wikipedia/en/e/e0/The_Amazing_Spider-Man_%28film%29_poster.jpg',
                height: double.infinity, 
                width: 135,   
                fit: BoxFit.fill,        
              ),
              Expanded(
                child: Column(
                  spacing:6,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,   
                      "Title : ${movie.title}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,                    
                    ),),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,   
                      "Date : ${movie.releasedate}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,                    
                    ),),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,   
                      "popularity : ${movie.popularity}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,                    
                    ),),                    
                    
                  ],            
                ),
              ),
              Icon(Icons.arrow_forward_ios,size: 15,),
                
            ],
          ),
        ),
      ),
    );
  }
}