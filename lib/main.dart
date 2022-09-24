// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PickResult selectedPlace = PickResult();
  String _txt = 'Load Google Map';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor('2832c2'),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 200,
        backgroundColor: HexColor(
          '2832c2',
        ),
        title: const Center(
            child: Text(
          'Sign In',
          style: TextStyle(fontFamily: 'DMSans'),
        )),
      ),
      body: FadeInUp(
        duration: Duration(milliseconds: 1500),
        child: Container(
          //the big one
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              border: Border.all(
                  width: 2, color: Colors.grey, style: BorderStyle.none)),
          child: Column( //first column
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: FadeInUp(
                  child: Container(
                      margin: EdgeInsets.only(top: 30, left: 30),
                      decoration: BoxDecoration(
                          //color: Colors.amber,
                          borderRadius: BorderRadius.circular(2)),
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                            height: 1,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: HexColor('101820'),
                            fontFamily: 'DMSans'),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FadeInUp(
                  child: Container(
                      //width: 350,
                      margin: EdgeInsets.only(top: 30, left: 30),
                      decoration: BoxDecoration(
                          //color: Colors.amber,
                          borderRadius: BorderRadius.circular(2)),
                      child: Text(
                        'Please Enter Your Credentials..',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                            height: 1,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: HexColor('101820'),
                            fontFamily: 'DMSans'),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FadeInUp(
                  child: Container(
                      width: 250,
                      height: 70,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(top: 30, left: 30),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'ID Number',
                            hintStyle: TextStyle(
                                color: HexColor('101820'), fontFamily: 'DMSans')),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      )),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FadeInUp(
                  child: Container(
                      width: 250,
                      height: 70,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(top: 30, left: 30),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                color: HexColor('101820'), fontFamily: 'DMSans')),
                        keyboardType: TextInputType.number,
                      )),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FadeInUp(
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                        color: HexColor('2832c2'),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(top: 30, left: 30),
                    padding: EdgeInsets.only(left: 10),
                    child: Builder(builder: (context) {
                      return Container(
                        child: TextButton(
                          child: Text(
                            _txt,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PlacePicker(
                                    apiKey:
                                        'AIzaSyCQxJRctkKeyb79U7IpKc1Wi3Tdbcd71Lc',
                                    initialPosition: MyHomePage.kInitialPosition,
                                    useCurrentLocation: true,
                                    selectInitialPosition: true,
                
                                    //usePlaceDetailSearch: true,
                                    onPlacePicked: (result) {
                                      selectedPlace = result;
                                      Navigator.of(context).pop();
                                      setState(() {
                                        _txt = selectedPlace.formattedAddress ?? "";
                                      });
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
