import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rps_ui_copy/custom/border_icon.dart';
import 'package:rps_ui_copy/screens/detail_page.dart';
import 'package:rps_ui_copy/screens/property_design.dart';
import 'package:rps_ui_copy/utils/constants.dart';
import 'package:rps_ui_copy/utils/custom_function.dart';
import 'package:rps_ui_copy/utils/sample_data.dart';
import 'package:rps_ui_copy/utils/widget_function.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25.0;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Custom Function used SizedBox
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '3D House Construction',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(20.0),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      'Lahore',
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(10.0),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                            padding: sidePadding,
                            child: Text(
                              'Lahore DHA',
                              style: themeData.textTheme.headline1,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: 25.0,
                      color: COLOR_GREY,
                    ),
                  ),
                  addVerticalSpace(10.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        "<\$220,000",
                        "For Sale",
                        "3-4 Beds",
                        "1000 sqft"
                      ].map((filter) => ChoiceOption(text: filter)).toList(),
                    ),
                  ),
                  addVerticalSpace(10.0),
                  Expanded(
                      child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: RE_DATA.length,
                        itemBuilder: (context, index) {
                          return RealEstateItem(
                            itemData: RE_DATA[index],
                          );
                        }),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: COLOR_GREY.withAlpha(25),
          borderRadius: BorderRadius.circular(20.0)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
                  itemData: itemData,
                )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(itemData["image"]),
                ),
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  "${formatCurrency(itemData["amount"])}",
                  style: themeData.textTheme.headline1,
                ),
                addHorizontalSpace(10),
                Text(
                  "${itemData["address"]}",
                  style: themeData.textTheme.bodyText2,
                )
              ],
            ),
            addVerticalSpace(10),
            Text(
              "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
              style: themeData.textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
