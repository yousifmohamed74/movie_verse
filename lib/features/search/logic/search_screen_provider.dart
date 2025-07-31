import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie_verse/core/Api/dio_factory.dart';
import 'package:movie_verse/core/api/api_constants.dart';
import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';
import 'package:movie_verse/features/search/models/search_response_model.dart';

class SearchScreenProvider extends ChangeNotifier{
  var searchcontroller=TextEditingController();

  final List<MovieModel> searchedmovies=[];
  void getSearchedMovies()async{
    try{
      final response= await DioFactory.getMoviesBySearch(
        title: searchcontroller.text,
        path: ApiConstants.searchmovies,
      );
      final data=SearchResponseModel.fromJson(response.data);
      searchedmovies.clear();
      searchedmovies.addAll(data.results);
      log("ok");
      notifyListeners();
    }catch(e){
      log("error$e");
    }
    
  }
}