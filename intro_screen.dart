import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:rps_ui_copy/screens/home_screen.dart';

class IntroPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 500,
              padding: EdgeInsets.only(left: 3, right: 3),
              margin: EdgeInsets.only(left: 2, right: 2),
              child: AspectRatio(
                aspectRatio: 2.0,
                child: Carousel(
                  boxFit: BoxFit.fitWidth,
                  images: [
                    AssetImage('assets/images/intro.jpeg'),
                    AssetImage('assets/images/latest1F.jpeg'),
                    AssetImage('assets/images/latest2F.jpeg'),
                    AssetImage('assets/images/latest3F.jpeg'),

                  ],
                  autoplay: true,
                  dotColor: Colors.blue,
                  dotBgColor: Colors.transparent,
                  showIndicator: true,
                  dotSize: 5.0,
                  dotSpacing: 20.0,
                  dotPosition: DotPosition.bottomCenter,

                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen(
                        )));
                  },
                  child: Text('Skip' , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),),
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen(
                        )));
                  },
                  child: Text('Get Started' , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),),
              ],)

          ],
        ),
      ),
    );
  }
}
