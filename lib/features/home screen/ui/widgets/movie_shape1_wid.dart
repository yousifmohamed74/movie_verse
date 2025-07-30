import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/core/api/api_constants.dart';
import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';
import 'package:movie_verse/features/movie%20details/ui/moviedetails_screen.dart';

// ignore: must_be_immutable
class MovieShape1Wid extends StatelessWidget {
  MovieModel movie;
  MovieShape1Wid({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie,),)
        );
      },
      child: Container(        
        width: 150,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: SemiDarkThemeColors.searchBarBackground,
        ),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl:ApiConstants.imagebaseUrl+movie.posterpath,
              height: 140, 
              width: double.infinity,   
              fit: BoxFit.fill,        
            ),
            Expanded(
              child: Text(movie.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),),
            ),
          ],
        ),
      ),
    );
  }
}