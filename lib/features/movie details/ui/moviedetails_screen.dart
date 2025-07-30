import 'package:flutter/material.dart';
import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';

// ignore: must_be_immutable
class MovieDetailsScreen extends StatelessWidget {
  MovieModel movie;
   MovieDetailsScreen({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
      
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(children: [
                
              ],)
              
            ],
          ),
        ),
      ),

    );
  }
}