import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import './property_design.dart';


class HouseSize extends StatefulWidget {

  @override
  _HouseSizeState createState() => _HouseSizeState();
}

class _HouseSizeState extends State<HouseSize> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/images/size.png",
                    fit: BoxFit.contain,
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text('Confirm Shape of Your House' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),)),
              SizedBox(height: 30,),
              // TextButton(
              //   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue), fixedSize: MaterialStateProperty.all(20)),
              //   onPressed: (){
              //     // Navigator.of(context).push(MaterialPageRoute(
              //     //     builder: (context) => HomeScreen(
              //     //     )));
              //   },
              //   child: Text('Triangle' , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),),
              TextButton(
                child: Container(
                  child: Text(
                    'Triangle',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _bottomSheet(context);
                },
              ),
              SizedBox(height: 10,),
              TextButton(
                child: Container(
                  child: Text(
                    'Rectangle',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _bottomSheet(context);
                },
              ),
              SizedBox(height: 10,),
              TextButton(
                child: Container(
                  child: Text(
                    'Square',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _bottomSheet(context);
                },
              ),
              SizedBox(
                height: 50,
              ),

            ],
          ),
        ),
      ),
    );
  }
  void _bottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            color: Colors.white,
            child: Wrap(
              children: [
                ListTile(
                    leading: const Icon(Icons.photo_camera_outlined),
                    title: const Text('Camera'),
                    onTap: () => {
                      pickImage(ImageSource.camera),
                      Navigator.of(context).pop(),
                    }),
                ListTile(
                  leading: const Icon(Icons.collections_outlined),
                  title: const Text('Gallery'),
                  onTap: () => {
                    pickImage(ImageSource.gallery),
                    Navigator.of(context).pop(),
                  },
                ),
              ],
            ),
          );
        }
    );
  }

  //Method to Open The Photo Gallery
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker.pickImage(source: source,maxWidth: 225,maxHeight: 225);

      if (image == null) return;
      final picture = File(image.path);
      setState(() {

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ShowProperty(
            )));

        //profileImage = picture;
      });
    } on PlatformException catch (e) {

    }
  }
}


