import 'package:flutter/material.dart';
import 'package:movie/models/movie_details.dart';
import 'package:movie/sevices/api_sevices_details.dart';

class Movie_Descriptions extends StatefulWidget {
  Movie_Descriptions({Key? key, required this.movie}) : super(key: key);
  Movie_Details movie;

  @override
  State<Movie_Descriptions> createState() => _Movie_DescriptionsState();
}

class _Movie_DescriptionsState extends State<Movie_Descriptions> {
  API_Services_Details cliant = API_Services_Details();
  bool _isLoader = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height / 1.8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.themoviedb.org/t/p/w220_and_h330_face${widget.movie.poster_path.toString()}"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        _isLoader ? Positioned(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 8, top: 8),
                                  width: size.width / 10,
                                  height: size.height / 10,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    color: Colors.white54,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.navigate_before,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 30, top: 8),
                                  width: size.width / 5,
                                  height: size.height / 20,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32)),
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    color: Colors.white54,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Align(
                                      child: Text(
                                    widget.movie.vote_average.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ): Padding(
                          padding: const EdgeInsets.all(200),
                          child: Center(
                            child: CircularProgressIndicator(
                                color: Color(0xFF00FF00)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 15.0, left: 8.0, right: 8.0, bottom: 50.0),
                      width: size.width,
                      color: Colors.black,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.movie.title.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF00FF00),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Release : ${widget.movie.release_date.toString()}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.movie.overview.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Top Rated",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFF00FF00),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 125,
                            child: FutureBuilder(
                              future: cliant.getMovie_Details(
                                  "https://api.themoviedb.org/3/movie/top_rated?api_key=11709e2da6330a263c7815e1cf8096bb&language=en-US&page=1"),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<Movie_Details>> snapshot) {
                                if (snapshot.hasData) {
                                  List<Movie_Details>? movie = snapshot.data;
                                  return ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              Future.delayed(
                                                  Duration(milliseconds: 10), () {
                                                setState(() {
                                                  //widget.movie = movie[index];
                                                  _isLoader=false;
                                                });
                                                    Future.delayed(
                                                        Duration(seconds: 1), () {
                                                      setState(() {
                                                        widget.movie = movie[index];
                                                        _isLoader=true;
                                                      });
                                                    });
                                              });
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 5),
                                              width: 125,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFF00FF00),
                                                    blurRadius: 3,
                                                    offset: Offset(-3, 2),
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: const Color(0xffF1FFF2),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://www.themoviedb.org/t/p/w220_and_h330_face${movie[index].poster_path.toString()}"),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: 10,
                                          ),
                                      itemCount: movie!.length);
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                      color: Color(0xFF00FF00)
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
