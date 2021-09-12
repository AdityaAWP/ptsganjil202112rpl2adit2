import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
                        children: [
                          Container(
                              height: 200,
                              width: 200,
                              child: Image(
                                image: AssetImage('assets/spalshscreen.png'),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                Text(
                                  'genre',
                                  style: TextStyle(
                                      fontSize: 14, letterSpacing: 0.8),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Publisher',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text('Release-Date')
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
                              image: AssetImage('assets/spalshscreen.png'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image(
                              image: AssetImage('assets/spalshscreen.png'),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Deskirpsi'),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: Text('Link ke game'))
                    ],
                  ))),
        ],
      ),
    );
  }
}
