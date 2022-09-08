import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rps_ui_copy/custom/border_icon.dart';
import 'package:rps_ui_copy/screens/house_size.dart';
import 'package:rps_ui_copy/screens/property_design.dart';
import 'package:rps_ui_copy/utils/constants.dart';
import 'package:rps_ui_copy/utils/custom_function.dart';
import 'package:rps_ui_copy/utils/widget_function.dart';
import './house_size.dart';

class DetailPage extends StatefulWidget {
  final dynamic itemData;

  const DetailPage({Key key, @required this.itemData}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(widget.itemData["image"]),
                      Positioned(
                          width: size.width,
                          top: padding,
                          child: Padding(
                            padding: sidePadding,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: BorderIcon(
                                      height: 50,
                                      width: 50,
                                      child: Icon(
                                        Icons.keyboard_backspace,
                                        color: COLOR_BLACK,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${formatCurrency(widget.itemData["amount"])}",
                              style: themeData.textTheme.headline1,
                            ),
                            addVerticalSpace(5),
                            Text(
                              "\$${widget.itemData["address"]}",
                              style: themeData.textTheme.subtitle2,
                            )
                          ],
                        ),
                        BorderIcon(
                          child: Text(
                            "20 Hours ago",
                            style: themeData.textTheme.headline5,
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                        )
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "House Information",
                      style: themeData.textTheme.headline4,
                    ),
                  ),
                  addVerticalSpace(padding),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        InformationTile(
                          content: "${widget.itemData["area"]}",
                          name: "Square Foot",
                        ),
                        InformationTile(
                          content: "${widget.itemData["bedrooms"]}",
                          name: "Bedrooms",
                        ),
                        InformationTile(
                          content: "${widget.itemData["bathrooms"]}",
                          name: "Bathrooms",
                        ),
                        InformationTile(
                          content: "${widget.itemData["garage"]}",
                          name: "Garage",
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      widget.itemData["description"],
                      textAlign: TextAlign.justify,
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(100),
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    InkWell(
                      onTap: (){
                        // _bottomSheet(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HouseSize()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                        decoration:BoxDecoration(
                            color: Colors.black,
                            borderRadius:BorderRadius.circular(20)
                        ),
                        child: Text("Verify Your Plot Design",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),

                    addHorizontalSpace(10),

                  ],
                ))
          ],
        ),
      ),
    );
  }

  // void _bottomSheet(context){
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc){
  //         return Container(
  //           color: Colors.white,
  //           child: Wrap(
  //             children: [
  //               ListTile(
  //                   leading: const Icon(Icons.photo_camera_outlined),
  //                   title: const Text('Camera'),
  //                   onTap: () => {
  //                     pickImage(ImageSource.camera),
  //                     Navigator.of(context).pop(),
  //                   }),
  //               ListTile(
  //                 leading: const Icon(Icons.collections_outlined),
  //                 title: const Text('Gallery'),
  //                 onTap: () => {
  //                   pickImage(ImageSource.gallery),
  //                   Navigator.of(context).pop(),
  //                 },
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //   );
  // }
  //
  // //Method to Open The Photo Gallery
  // Future pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker.pickImage(source: source,maxWidth: 225,maxHeight: 225);
  //
  //     if (image == null) return;
  //     final picture = File(image.path);
  //     setState(() {
  //
  //       Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => ShowProperty(
  //           )));
  //
  //       //profileImage = picture;
  //     });
  //   } on PlatformException catch (e) {
  //
  //   }
  // }
}



class InformationTile extends StatelessWidget {
  final String content;
  final String name;

  const InformationTile({Key key, @required this.content, @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double tileSize = size.width * 0.20;
    return Container(
      margin: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BorderIcon(
              width: tileSize,
              height: tileSize,
              child: Text(
                content,
                style: themeData.textTheme.headline3,
              )),
          addVerticalSpace(15),
          Text(
            name,
            style: themeData.textTheme.headline6,
          )
        ],
      ),
    );
  }
}
