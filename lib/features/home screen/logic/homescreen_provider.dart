import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie_verse/core/api/api_constants.dart';
import 'package:movie_verse/core/api/dio_factory.dart';
import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';



class HomescreenProvider extends ChangeNotifier{
  
  final List <MovieModel> trendingmovies=[];
  void getTrendingMovies()async{
    try{
      final response=await DioFactory.getData(
        path: ApiConstants.trending,
      );
      final data=TrendingResponseModel.fromJson(response.data);
      trendingmovies.clear();
      trendingmovies.addAll(data.results);
      notifyListeners();
    }catch(e){
      log(e.toString());
    }   
  }
  
  final Map nowplayingmoviesdates={};
  final List <MovieModel> nowplayingmovies=[];
  void getNowPlayingMovies()async{
    try{
      final response=await DioFactory.getData(
        path: ApiConstants.nowplaying,
      );
      final data=NowPlayingResponseModel.fromJson(response.data);
      nowplayingmovies.clear();
      nowplayingmovies.addAll(data.results);
      nowplayingmoviesdates.clear();
      nowplayingmoviesdates.addAll(data.dates);
      notifyListeners();
    }catch(e){
      log(e.toString());
    }   
  }


  final List <MovieModel> topratedmovies=[];
  void getTopRatedMovies()async{
    try{
      final response=await DioFactory.getData(
        path: ApiConstants.toprated,
      );
      final data=TopRatedResponseModel.fromJson(response.data);
      topratedmovies.clear();
      topratedmovies.addAll(data.results);
      notifyListeners();
    }catch(e){
      log(e.toString());
    }   
  }




  final Map upcomingmoviesdates={};
  final List <MovieModel> upcomingmovies=[];
  void getUpcomingMovies()async{
    try{
      final response=await DioFactory.getData(
        path: ApiConstants.upcoming,
      );
      final data=UpcomingResponseModel.fromJson(response.data);
      upcomingmovies.clear();
      upcomingmovies.addAll(data.results);
      upcomingmoviesdates.clear();
      upcomingmoviesdates.addAll(data.dates);
      notifyListeners();
    }catch(e){
      log(e.toString());
    }   
  }



}