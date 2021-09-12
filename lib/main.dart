import 'package:flutter/material.dart';
import 'package:mid_test/menu.dart';
import 'package:mid_test/slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List _pages = [
    SliderPage(
      title: "Cari Berbagai Macam Game",
      description:
          "Cari tau game game gratis terbaru, jangan mau spent uang di game berbayar karena dengan yang gratis anda bisa menghemat uang anda buat makan dan beli kibot",
      image: "assets/OnBoard1.svg",
    ),
    SliderPage(
      title: "Masuk dan mulai",
      description: "Masuk dan cari tau game sesuai genre kesukaanmu",
      image: "assets/OnBoard2.svg",
    ),
  ];

  _OnChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _OnChanged,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pages.length, (int index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage)
                            ? Colors.indigo
                            : Colors.indigo.withOpacity(0.5)),
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOut);
                  if (_currentPage == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GameList()));
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  alignment: Alignment.center,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 70,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: (_currentPage == (_pages.length - 1))
                      ? Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      : Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 50,
                        ),
                ),
              ),
              SizedBox(height: 40)
            ],
          )
        ],
      ),
    );
  }
}
