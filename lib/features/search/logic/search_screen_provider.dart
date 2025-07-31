import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/core/Api/api_constants.dart';
import 'package:movie_verse/core/Api/dio_factory.dart';
import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';
import 'package:movie_verse/features/search/models/search_response_model.dart';

class SearchScreenProvider extends ChangeNotifier{
  var searchcontroller=TextEditingController();

  final List<MovieModel> searchedmovies=[];
  void getSearchedMovies()async{
    try{
      final response= await DioFactory.getMoviesBySearch(
        title: searchcontroller.text,
        path: ApiConstants.searchmovies
      );
      final data=SearchResponseModel.fromJson(response.data);
      //searchedmovies.clear();
      searchedmovies.addAll(data.results);
      notifyListeners();
    }catch(e){
      log(e.toString()??"Embty");
    }
    
  }
}