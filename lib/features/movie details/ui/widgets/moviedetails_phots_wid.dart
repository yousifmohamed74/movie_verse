import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_verse/core/api/api_constants.dart';
import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';

class MoviedetailsPhotsWid extends StatelessWidget {
  MovieModel movie;
   MoviedetailsPhotsWid({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [                        
        Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15),bottomRight: Radius.circular(15)),
          ),
          child: CachedNetworkImage(
            imageUrl:movie.backdroppath.isNotEmpty?
              ApiConstants.imagebaseUrl+movie.backdroppath:
              'https://upload.wikimedia.org/wikipedia/en/e/e0/The_Amazing_Spider-Man_%28film%29_poster.jpg',            
            height: 210, 
            width: double.infinity,   
            fit: BoxFit.fill,        
          ),
        ),
        Positioned(                          
          bottom: -50,
          left: 25,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            child: CachedNetworkImage(
              imageUrl:movie.posterpath.isNotEmpty?
                ApiConstants.imagebaseUrl+movie.posterpath:
                'https://upload.wikimedia.org/wikipedia/en/e/e0/The_Amazing_Spider-Man_%28film%29_poster.jpg',
              height: 140, 
              width: 140,   
              fit: BoxFit.fill,        
            ),
          ),
        ),
      ],
    );
  }
}