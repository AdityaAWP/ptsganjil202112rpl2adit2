import 'package:flutter/material.dart';
import 'package:mid_test/menuModel.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  final Games game;

  const Detail({Key? key, required this.game}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff243447),
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/spalshscreen.png'),
          ),
          Container(
              height: 555,
              width: 400,
              child: Card(
                  color: Color(0xffEEEDED),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200.0),
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(widget.game.thumbnail),
                                height: 200.0,
                                width: 200.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.game.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                Text(
                                  widget.game.genre,
                                  style: TextStyle(
                                      fontSize: 14, letterSpacing: 0.8),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    widget.game.publisher,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(widget.game.release_date)
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image(
                              image: NetworkImage(widget.game.thumbnail),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image(
                              image: NetworkImage(widget.game.thumbnail),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(widget.game.short_description),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _launchURL(widget.game.game_url);
                          },
                          child: Text('Kunjungi Game'))
                    ],
                  ))),
        ],
      ),
    );
  }
}
