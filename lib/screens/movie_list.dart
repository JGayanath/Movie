import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/models/movie_details.dart';
import 'package:movie/screens/movie_descriptions.dart';
import 'package:movie/sevices/api_sevices_details.dart';

class Movie_List extends StatefulWidget {
  const Movie_List({Key? key}) : super(key: key);

  @override
  State<Movie_List> createState() => _Movie_ListState();
}

class _Movie_ListState extends State<Movie_List> {
  API_Services_Details cliant = API_Services_Details();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //----default catogory link asing
    catogoryLink =
        "https://api.themoviedb.org/3/movie/popular?api_key=11709e2da6330a263c7815e1cf8096bb&language=en-US&page=1";
  }

  //----select catogory list link asing variable
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    Future.delayed(Duration(seconds: 1), () {
      _isLoader=true;
      setState(() {
        switch(selectedValue){
          case "Upcoming": {
            catogoryLink =
            "https://api.themoviedb.org/3/movie/upcoming?api_key=11709e2da6330a263c7815e1cf8096bb&language&language=en-US&page=1";
          }
          break;
          case "Popular": {
            catogoryLink =
            "https://api.themoviedb.org/3/movie/popular?api_key=11709e2da6330a263c7815e1cf8096bb&language=en-US&page=1";
          }
          break;
          case "Top Rated": {
            catogoryLink =
            "https://api.themoviedb.org/3/movie/top_rated?api_key=11709e2da6330a263c7815e1cf8096bb&language=en-US&page=1";
          }
          break;
          default: {
            catogoryLink =
            "https://api.themoviedb.org/3/movie/now_playing?api_key=11709e2da6330a263c7815e1cf8096bb&language&language=en-US&page=1";
          }
          break;
        }
      });
    });

  }

  //----select catogory list
  final List<String> items = [
    'Now Playing',
    'Popular',
    'Top Rated',
    'Upcoming'
  ];

  //----default catogory
  String? selectedValue = 'Popular';

  //----catogory link
  late String catogoryLink;

  bool _isLoader = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        toolbarHeight: 200,
        backgroundColor: Colors.black,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Movies",
                      style: TextStyle(color: Color(0xFF00FF00), fontSize: 34),
                    ),
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: Color(0xffFDCF09),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage:
                            AssetImage('assets/images/proacademy.jpeg'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "The greatest movies for you",
                    style: TextStyle(fontSize: 16),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(36),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _isLoader=false;
                            selectedValue=value.toString();
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                        ),
                        iconSize: 30,
                        iconEnabledColor: Color(0xFF00FF00),
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 50,
                        buttonWidth: 160,
                        //buttonPadding: const EdgeInsets.only(left: 14, right: 20),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          color: Colors.black,
                        ),
                        buttonElevation: 2,
                        itemHeight: 70,
                        //itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 500,
                        dropdownWidth: 200,
                        //dropdownPadding: EdgeInsets.all(8),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.black,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text(
                    "View all",
                    style: TextStyle(color: Color(0xFF00FF00)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.black,
        child: _isLoader
            ? FutureBuilder(
                future: cliant.getMovie_Details(catogoryLink),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Movie_Details>> snapshot) {
                  if (snapshot.hasData) {
                    List<Movie_Details>? movie = snapshot.data;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 2,
                        crossAxisCount: 2,
                      ),
                      itemCount: movie!.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Movie_Descriptions(
                                movie: movie[index],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF00FF00)
                                      .withOpacity(0.5), //color of shadow
                                  spreadRadius: 3, //spread radius
                                  blurRadius: 5, // blur radius
                                  offset: const Offset(
                                      0, 2), // changes position of shadow
                                ),
                                //you can set more BoxShadow() here
                              ],
                              border: Border.all(
                                color: Color(0xFF00FF00),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.themoviedb.org/t/p/w220_and_h330_face${movie[index].poster_path.toString()}"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                        color: Color(0xFF00FF00)
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF00FF00),
                ),
              ),
      ),
    );
  }
}
