import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_verse/core/api/api_constants.dart';
import 'package:movie_verse/core/api/dio_factory.dart';
import 'package:movie_verse/features/movie%20details/models/genres_model.dart';

class MovieDetailsScreenProvider extends ChangeNotifier{

  final List <GenresModel>allgenres=[];  
  void getAllGenres()async{
    try{
      final response=await DioFactory.getData(
        path: ApiConstants.genres,
      );
      final data=GenresResponseModel.fromJson(response.data);      
      allgenres.addAll(data.genres);
      notifyListeners();
    }catch(e){
      log(e.toString());
    }   
  }

  List currentmovieGenres=[];
  void getmovieGenres(List moviegeners)async{
    currentmovieGenres.clear();
    for(int i=0;i<moviegeners.length;i++){
      for(int j=0;j<allgenres.length;j++){
        if(moviegeners[i]==allgenres[j].id){
          currentmovieGenres.add(allgenres[j].name);
        }      
      }   
    }
  }

}