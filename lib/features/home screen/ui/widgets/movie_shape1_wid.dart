import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_verse/core/api/api_constants.dart';
import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';

// ignore: must_be_immutable
class MovieShape1Wid extends StatelessWidget {
  MovieModel movie;
  MovieShape1Wid({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(        
        width: 135,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl:ApiConstants.imagebaseUrl+movie.posterpath,
              height: 150, 
              width: double.infinity,   
              fit: BoxFit.fill,        
            ),
            Expanded(
              child: Text(movie.title,style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15
              ),),
            ),
          ],
        ),
      ),
    );
  }
}