class Movie_Details {
  int? id;
  String? title;
  String? overview;
  String? poster_path;
  String? release_date;
  var vote_average;

  Movie_Details({
    this.id,
    this.title,
    this.overview,
    this.poster_path,
    this.release_date,
    this.vote_average,
  });

  factory Movie_Details.fromJson(Map<String, dynamic> json) {
    return Movie_Details(
      id: json["id"] == null ? "" : json["id"],
      title:
          json["title"] == null ? "" : json["title"],
      overview: json["overview"] == null ? "" : json["overview"],
      poster_path: json["poster_path"] == null ? "" : json["poster_path"],
      release_date: json["release_date"] == null ? "" : json["release_date"],
      vote_average: json["vote_average"] == null ? "" : json["vote_average"],

    );
  }
}
