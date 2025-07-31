class GenresResponseModel {
  List <GenresModel> genres;
  GenresResponseModel(this.genres);

  factory GenresResponseModel.fromJson(Map<String,dynamic>json)=>
  GenresResponseModel(
   
    (json["genres"]as List)
    .map((e) => GenresModel.fromJson(e)).toList(),
    );
  
}

class GenresModel{
  int id;
  String name;
  GenresModel(this.id,this.name);
  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
    json["id"],
    json["name"]
  );
}