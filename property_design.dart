import 'package:flutter/material.dart';
import 'package:rps_ui_copy/utils/sample_data.dart';

import 'home_screen.dart';

class ShowProperty extends StatefulWidget {

  final dynamic itemData;

  // const DetailPage({Key key, @required this.itemData}) : super(key: key);

  const ShowProperty({Key key , @required this.itemData}) : super(key: key);

  @override
  _ShowPropertyState createState() => _ShowPropertyState();
}

class _ShowPropertyState extends State<ShowProperty> {
  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     physics: BouncingScrollPhysics(),
    //     itemCount: RE_DATA.length,
    //     itemBuilder: (context, index) {
    //       return RealEstateItem(
    //         itemData: RE_DATA[index]);
    return Container(
      child: Image.asset("assets/images/triangle.jpeg"),
      color: Colors.white,
    );

        // }, );
}
}
