import 'package:flutter/material.dart';
import 'package:mid_test/detail.dart';
import 'package:mid_test/menuModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GameList extends StatefulWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  void initState() {
    super.initState();
    loadFormJson();
  }

  bool isloading = true;
  late GamesModel gameModel;

  void loadFormJson() async {
    final res = await http
        .get(Uri.parse("https://api.jsonbin.io/b/613c446b9548541c29afe943"));
    if (res.statusCode == 200) {
      print("hasil : " + res.body.toString());
      gameModel = GamesModel.fromJson(json.decode(res.body.toString()));
      setState(() {
        isloading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff243447),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'Welcome To Black Belt',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Discover Your Favourite Free Game!!!',
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: .8),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      'Newest Game',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 569,
                    width: 400,
                    child: Card(
                      color: Color(0xffEEEDED),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: gameModel.games.length,
                        itemBuilder: (context, index) {
                          Games game = gameModel.games[index];
                          return Card(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 100,
                                        width: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(200),
                                          child: CachedNetworkImage(
                                              imageUrl: gameModel
                                                  .games[index].thumbnail,
                                              placeholder: (context, url) =>
                                                  Image.asset(
                                                    'assets/spalshscreen.png',
                                                    height: 100,
                                                  )),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              gameModel.games[index].title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(gameModel.games[index].genre),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Detail(
                                                          game: game,
                                                        )));
                                          },
                                          child: Text("Detail")),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
