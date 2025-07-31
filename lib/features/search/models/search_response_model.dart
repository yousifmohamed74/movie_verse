import 'package:movie_verse/features/home%20screen/models/movie_responses_model.dart';

class SearchResponseModel {
  int page;
  List <MovieModel> results; 
  int totlapages;  
  int totalresults;

  SearchResponseModel(this.page,this.results,this.totlapages,this.totalresults);

  factory SearchResponseModel.fromJson(Map<String,dynamic>json)=>
  SearchResponseModel(
    json["page"], 
    (json["results"]as List)
    .map((e) => MovieModel.fromJson(e)).toList(),
    json["total_pages"],
   json["total_results"],);

}