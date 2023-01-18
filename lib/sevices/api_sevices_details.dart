
import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie/models/movie_details.dart';


class API_Services_Details{

  //final endPoint = "https://api.themoviedb.org/3/movie/popular?api_key=11709e2da6330a263c7815e1cf8096bb&language=en-US&page=1";
  Future<List<Movie_Details>> getMovie_Details(String endPoint) async{

    Response response = await get(Uri.parse(endPoint)); // get response uri

    if(response.statusCode== 200) {

      Map<String , dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json["results"];

      List<Movie_Details> movie = body.map((dynamic item) => Movie_Details.fromJson(item)).toList();

      return movie;

    }else{
      throw("can\'t open");
    }

  }

  Future<List<Movie_Details>> getMovie_Link(String endPoint) async{

    Response response = await get(Uri.parse(endPoint)); // get response uri

    if(response.statusCode== 200) {

      Map<String , dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json["results"];

      List<Movie_Details> movies = body.map((dynamic item) => Movie_Details.fromJson(item)).toList();

      return movies;

    }else{
      throw("can\'t open");
    }

  }
  static List<Movie_Details> fromJsonList(List list) {
    if (list == null) return null!;
    return list.map((item) => Movie_Details.fromJson(item)).toList();
  }

}