class TrendingResponseModel{
  int page;
  List <MovieModel> results; 
  int totlapages;  
  int totalresults;

  TrendingResponseModel(this.page,this.results,this.totlapages,this.totalresults);

  factory TrendingResponseModel.fromJson(Map<String,dynamic>json)=>
  TrendingResponseModel(
    json["page"], 
    (json["results"]as List)
    .map((e) => MovieModel.fromJson(e)).toList(),
    json["total_pages"],
   json["total_results"],);
}

class NowPlayingResponseModel{
  Map<String,String> dates;
  int page;
  List <MovieModel> results; 
  int totlapages;  
  int totalresults;

  NowPlayingResponseModel(this.dates,this.page,this.results,this.totlapages,this.totalresults,);

  factory NowPlayingResponseModel.fromJson(Map<String,dynamic>json)=>
  NowPlayingResponseModel(
    json["dates"],
    json["page"], 
    (json["results"]as List)
    .map((e) => MovieModel.fromJson(e)).toList(),
    json["total_pages"],
   json["total_results"],);
}


class TopRatedResponseModel{
  int page;
  List <MovieModel> results; 
  int totlapages;  
  int totalresults;

  TopRatedResponseModel(this.page,this.results,this.totlapages,this.totalresults);

  factory TopRatedResponseModel.fromJson(Map<String,dynamic>json)=>
  TopRatedResponseModel(
    json["page"], 
    (json["results"]as List)
    .map((e) => MovieModel.fromJson(e)).toList(),
    json["total_pages"],
   json["total_results"],);
}


class UpcomingResponseModel{
  Map<String,String> dates;
  int page;
  List <MovieModel> results; 
  int totalpages;  
  int totalresults;

  UpcomingResponseModel(this.dates,this.page,this.results,this.totalpages,this.totalresults,);

  factory UpcomingResponseModel.fromJson(Map<String,dynamic>json)=>
  UpcomingResponseModel(
    json["dates"],
    json["page"], 
    (json["results"]as List)
    .map((e) => MovieModel.fromJson(e)).toList(),
    json["total_pages"],
   json["total_results"],);
}








class MovieModel{
  bool adult;
  String backdroppath;
  List genreids;
  int id;
  String originallanguage;
  String originaltitle;
  String overview;
  double popularity;
  String posterpath;
  String releasedate;
  String title;
  bool video;
  double voteaverage;
  int votecount;
  MovieModel(
     this.adult,
     this.backdroppath,
     this.genreids,
     this.id,
     this.originallanguage,
     this.originaltitle,
     this.overview,
     this.popularity,
     this.posterpath,
     this.releasedate,
     this.title,
     this.video,
     this.voteaverage,
     this.votecount,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    json["adult"],
    json["backdrop_path"],
    json["genre_ids"],
    json["id"],
    json["original_language"],
    json["original_title"],
    json["overview"],
    json["popularity"].toDouble(),
    json["poster_path"],
    json["release_date"],
    json["title"],
    json["video"],
    json["vote_average"].toDouble(),
    json["vote_count"],
  );
}