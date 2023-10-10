import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/business/movie/viewmovie_cubit.dart';
import 'package:movies/const.dart';
import 'package:movies/model/movie/moviemodel.dart';
import 'package:movies/model/movie/moviemodel.dart';
import 'package:movies/model/movie/moviemodel.dart';
import 'package:movies/model/movie/moviemodel.dart';
import 'package:movies/view/insideapp/userinfo.dart';

import '../../model/movie/moviemodel.dart';
var  Result=[];
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final List<String> imgList = [
  'https://th.bing.com/th/id/R.0de10e385bfd39172658f1cb54ce4351?rik=aCd19SzWt6pnrQ&pid=ImgRaw&r=0',
  'https://th.bing.com/th/id/OIP.cSmHHJbAO9qI0DWHESH2pgAAAA?pid=ImgDet&rs=1',
  'https://th.bing.com/th/id/R.0de10e385bfd39172658f1cb54ce4351?rik=aCd19SzWt6pnrQ&pid=ImgRaw&r=0',
  'https://th.bing.com/th/id/OIP.cSmHHJbAO9qI0DWHESH2pgAAAA?pid=ImgDet&rs=1',
  'https://th.bing.com/th/id/R.934114fb58fbbe952a16fef1bf6f8404?rik=qn3jtZYHP1ZLNA&riu=http%3a%2f%2f4.bp.blogspot.com%2f-Huj-6TfEI6s%2fURZokUkSvWI%2fAAAAAAAAAZQ%2f5JwKBJD4Wws%2fs1600%2fLOOPER-poster-bande-annonce-gordon-levit-1024x768.jpg&ehk=5j%2bxwoVX0fBBoMHrovenJTrry%2b1eLQKptTDXXCIb%2byE%3d&risl=&pid=ImgRaw&r=0',
  'https://th.bing.com/th/id/R.0de10e385bfd39172658f1cb54ce4351?rik=aCd19SzWt6pnrQ&pid=ImgRaw&r=0',
  'https://th.bing.com/th/id/OIP.cSmHHJbAO9qI0DWHESH2pgAAAA?pid=ImgDet&rs=1',
  'https://th.bing.com/th/id/R.934114fb58fbbe952a16fef1bf6f8404?rik=qn3jtZYHP1ZLNA&riu=http%3a%2f%2f4.bp.blogspot.com%2f-Huj-6TfEI6s%2fURZokUkSvWI%2fAAAAAAAAAZQ%2f5JwKBJD4Wws%2fs1600%2fLOOPER-poster-bande-annonce-gordon-levit-1024x768.jpg&ehk=5j%2bxwoVX0fBBoMHrovenJTrry%2b1eLQKptTDXXCIb%2byE%3d&risl=&pid=ImgRaw&r=0',
  'https://th.bing.com/th/id/R.934114fb58fbbe952a16fef1bf6f8404?rik=qn3jtZYHP1ZLNA&riu=http%3a%2f%2f4.bp.blogspot.com%2f-Huj-6TfEI6s%2fURZokUkSvWI%2fAAAAAAAAAZQ%2f5JwKBJD4Wws%2fs1600%2fLOOPER-poster-bande-annonce-gordon-levit-1024x768.jpg&ehk=5j%2bxwoVX0fBBoMHrovenJTrry%2b1eLQKptTDXXCIb%2byE%3d&risl=&pid=ImgRaw&r=0',
];

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    BlocProvider.of<ViewmovieCubit>(context).viewMovie();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewmovieCubit, ViewmovieState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

         // var transictionModel=cubit.movieModel;
        return Scaffold(backgroundColor: Colors.yellow[50],
          appBar: AppBar(
            backgroundColor: Colors.orange[800],
            leading:
            PopupMenuButton(
              icon: Icon(Icons.menu),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: name,
                    child: TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfo(),));
                    }, child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),))

                    ),

                  PopupMenuItem(
                    value: 'Home',
                    child: Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Conct us',
                    child: Text(
                      'Conct us',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                ];
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        // delegate to customize the search bar
                        delegate: CustomSearchDelegate());
                  },
                  icon: Icon(
                    size: 40,
                    Icons.search,
                    color: Colors.white,
                  ))
            ],
          ),
          body:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Upcoming", style: TextStyle(
                    fontFamily: "Amiri-BoldItalic", fontSize: 25,fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10,),
                ConditionalBuilder(condition: state is !ViewmovieLoading,
                    builder: (context) {
                  if(state is ViewmovieSuccess){
                    return
                      CarouselSlider(
                          items: imgList
                          .map((item) =>
                          Container(
                            width: 300,
                            decoration:BoxDecoration(
                              color: Colors.black87,
                                border: Border.all(width: 2,color: Colors.black)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Center(
                                        child: Image.network(
                                          item,
                                          fit: BoxFit.fill,
                                          width:500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(state.results[imgList.indexOf(item)].originalTitle!,style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                                  ),)
                                ],
                              ),
                            ),
                          ))
                          .toList(), options: CarouselOptions(
                          autoPlay: true, aspectRatio: 1.5,
                          enlargeCenterPage:false,
                        animateToClosest: true,

                      ));

                  }
                  else return Text(" Loading Faild");

                    },
                    fallback: (context) => CircularProgressIndicator(color: Colors.orange[800],), ),
                Divider(height: 4,color: Colors.black,),

                SizedBox(height: 10,),
                Divider(height: 4,color: Colors.black,),
                Text("Popular Movies", style: TextStyle(
                    fontFamily: "Amiri-BoldItalic", fontSize: 25,fontWeight: FontWeight.bold
                ),),
                ConditionalBuilder(condition: state is! ViewmovieLoading,
                    builder: (context) {
                  if(state is ViewmovieSuccess){
                    final results= state.results;
                    return
                      Expanded(
                        child: GridView.builder(

                          shrinkWrap: true,
                          itemCount:results.length,
                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ) ,
                          itemBuilder: (context, index) {
                            Result.add(results[index].originalTitle);
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:Border.all(width: 2,color:Colors.black87 )
                                ),
                                height: 150,
                                child: Card(

                                  color: Colors.yellow[100],
                                  child:SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          child:  Center(
                                            child: Image.network(
                                              imgList[index],
                                              fit: BoxFit.scaleDown,
                                              width:500,
                                            ),
                                          ),
                                          height: 100,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(results[index].title!,style: TextStyle(
                                          color: Colors.orange
                                        ),),
                                    const SizedBox(
                                      height: 10,
                                    ), //SizedBox
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(results[index].overview!,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                    ),
                                     )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                         ),
                      );
                  }else
                      return Text("ll");
                    },
                    fallback: (context) => CircularProgressIndicator(color: Colors.orange[800],)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = 'لا يوجد نتائج';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in Result) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return  ListTile(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) =>
            //         tran_widget[index]));
          },
          // title: Text(result),
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              Result[index],
              style: (TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600)),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var item in Result) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) =>
            //         tran_widget[index]));
          },
          title: Text(result),
        );
      },
    );
  }
}

