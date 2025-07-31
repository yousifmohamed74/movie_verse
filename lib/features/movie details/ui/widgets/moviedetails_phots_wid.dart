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
            imageUrl:ApiConstants.imagebaseUrl+movie.backdroppath,
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
              imageUrl:ApiConstants.imagebaseUrl+movie.posterpath,
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